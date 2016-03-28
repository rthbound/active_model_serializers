require 'test_helper'

module ActionController
  module Serialization
    class JsonApi
      class KeyTransformTest < ActionController::TestCase
        class KeyTransformTestController < ActionController::Base
          Post = Class.new(::Model)
          class PostSerializer < ActiveModel::Serializer
            type 'posts'
            attributes :title, :body, :publish_at
            belongs_to :author
            has_many :bad_comments

            link(:post_authors) { 'https://example.com/post_authors' }

            meta do
              {
                rating: 5,
                favorite_count: 10
              }
            end
          end

          Author = Class.new(::Model)
          class AuthorSerializer < ActiveModel::Serializer
            type 'authors'
            attributes :first_name, :last_name
          end

          BadComment = Class.new(::Model)
          class BadCommentSerializer < ActiveModel::Serializer
            type 'bad_comments'
            attributes :body
            belongs_to :author
          end

          def setup_post
            ActionController::Base.cache_store.clear
            @author = Author.new(id: 1, first_name: 'Bob', last_name: 'Jones')
            @comment1 = BadComment.new(id: 7, body: 'cool', author: @author)
            @comment2 = BadComment.new(id: 12, body: 'awesome', author: @author)
            @post = Post.new(id: 1337, title: 'Title 1', body: 'Body 1',
                             author: @author, bad_comments: [@comment1, @comment2],
                             publish_at: '2020-03-16T03:55:25.291Z')
            @comment1.post = @post
            @comment2.post = @post
          end

          def render_resource_with_key_transform
            setup_post
            render json: @post, serializer: PostSerializer, adapter: :json_api,
                   key_transform: :camel
          end

          def render_resource_with_key_transform_nil
            setup_post
            render json: @post, serializer: PostSerializer, adapter: :json_api,
                   key_transform: nil
          end

          def render_resource_with_key_transform_with_global_config
            setup_post
            old_transform = ActiveModelSerializers.config.key_transform
            ActiveModelSerializers.config.key_transform = :camel_lower
            render json: @post, serializer: PostSerializer, adapter: :json_api
            ActiveModelSerializers.config.key_transform = old_transform
          end
        end

        tests KeyTransformTestController

        def test_render_resource_with_key_transform
          get :render_resource_with_key_transform
          response = JSON.parse(@response.body)
          expected = {
            'Data' => {
              'Id' => '1337',
              'Type' => 'posts',
              'Attributes' => {
                'Title' => 'Title 1',
                'Body' => 'Body 1',
                'PublishAt' => '2020-03-16T03:55:25.291Z'
              },
              'Relationships' => {
                'Author' => {
                  'Data' => {
                    'Id' => '1',
                    'Type' => 'authors'
                  }
                },
                'BadComments' => {
                  'Data' => [
                    { 'Id' => '7', 'Type' => 'BadComments' },
                    { 'Id' => '12', 'Type' => 'BadComments' }
                  ]
                }
              },
              'Links' => {
                'PostAuthors' => 'https://example.com/post_authors'
              },
              'Meta' => { 'Rating' => 5, 'FavoriteCount' => 10 }
            }
          }
          assert_equal expected, response
        end

        def test_render_resource_with_key_transform_nil
          get :render_resource_with_key_transform_nil
          response = JSON.parse(@response.body)
          expected = {
            'data' => {
              'id' => '1337',
              'type' => 'posts',
              'attributes' => {
                'title' => 'Title 1',
                'body' => 'Body 1',
                'publish-at' => '2020-03-16T03:55:25.291Z'
              },
              'relationships' => {
                'author' => {
                  'data' => {
                    'id' => '1',
                    'type' => 'authors'
                  }
                },
                'bad-comments' => {
                  'data' => [
                    { 'id' => '7', 'type' => 'bad-comments' },
                    { 'id' => '12', 'type' => 'bad-comments' }
                  ]
                }
              },
              'links' => {
                'post-authors' => 'https://example.com/post_authors'
              },
              'meta' => { 'rating' => 5, 'favorite-count' => 10 }
            }
          }
          assert_equal expected, response
        end

        def test_render_resource_with_key_transform_with_global_config
          get :render_resource_with_key_transform_with_global_config
          response = JSON.parse(@response.body)
          expected =  {
            'data' => {
              'id' => '1337',
              'type' => 'posts',
              'attributes' => {
                'title' => 'Title 1',
                'body' => 'Body 1',
                'publishAt' => '2020-03-16T03:55:25.291Z'
              },
              'relationships' => {
                'author' => {
                  'data' => {
                    'id' => '1',
                    'type' => 'authors'
                  }
                },
                'badComments' => {
                  'data' => [
                    { 'id' => '7', 'type' => 'badComments' },
                    { 'id' => '12', 'type' => 'badComments' }
                  ]
                }
              },
              'links' => {
                'postAuthors' => 'https://example.com/post_authors'
              },
              'meta' => { 'rating' => 5, 'favoriteCount' => 10 }
            }
          }
          assert_equal expected, response
        end
      end
    end
  end
end
