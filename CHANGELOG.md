## 0.10.x

Breaking changes:

Features:
- [#1618](https://github.com/rails-api/active_model_serializers/issues/1618) Get collection root key for
  empty collection from explicit serializer option, when possible. (@bf4)
- [#1574](https://github.com/rails-api/active_model_serializers/pull/1574) Provide key translation. (@remear)
- [#1494](https://github.com/rails-api/active_model_serializers/pull/1494) Make serializers serializalbe
  (using the Attributes adapter by default). (@bf4)
- [#1550](https://github.com/rails-api/active_model_serializers/pull/1550) Add
  Rails url_helpers to `SerializationContext` for use in links. (@remear, @bf4)
- [#1004](https://github.com/rails-api/active_model_serializers/pull/1004) JSON API errors object implementation.
  - Only implements `detail` and `source` as derived from `ActiveModel::Error`
  - Provides checklist of remaining questions and remaining parts of the spec.
- [#1515](https://github.com/rails-api/active_model_serializers/pull/1515) Adds support for symbols to the
  `ActiveModel::Serializer.type` method. (@groyoh)
- [#1504](https://github.com/rails-api/active_model_serializers/pull/1504) Adds the changes missing from #1454
  and add more tests for resource identifier and relationship objects. Fix association block with link
  returning `data: nil`.(@groyoh)
- [#1372](https://github.com/rails-api/active_model_serializers/pull/1372) Support
  cache_store.read_multi. (@LcpMarvel)
- [#1018](https://github.com/rails-api/active_model_serializers/pull/1018) Add more tests and docs for top-level links. (@leandrocp)
- [#1454](https://github.com/rails-api/active_model_serializers/pull/1454) Add support for
  relationship-level links and meta attributes. (@beauby)
- [#1340](https://github.com/rails-api/active_model_serializers/pull/1340) Add support for resource-level meta. (@beauby)

Fixes:
- [#1478](https://github.com/rails-api/active_model_serializers/pull/1478) Cache store will now be correctly set when serializers are
  loaded *before* Rails initializes. (@bf4)
- [#1570](https://github.com/rails-api/active_model_serializers/pull/1570) Fixed pagination issue with last page size. (@bmorrall)
- [#1516](https://github.com/rails-api/active_model_serializers/pull/1516) No longer return a nil href when only
  adding meta to a relationship link. (@groyoh)
- [#1458](https://github.com/rails-api/active_model_serializers/pull/1458) Preserve the serializer
  type when fragment caching. (@bdmac)
- [#1477](https://github.com/rails-api/active_model_serializers/pull/1477) Fix `fragment_cached?`
  method to check if caching. (@bdmac)
- [#1501](https://github.com/rails-api/active_model_serializers/pull/1501) Adds tests for SerializableResource::use_adapter?,doc typos (@domitian)
- [#1488](https://github.com/rails-api/active_model_serializers/pull/1488) Require ActiveSupport's string inflections (@nate00)

Misc:
- [#1602](https://github.com/rails-api/active_model_serializers/pull/1602) Add output examples to Adapters docs (@remear)
- [#1557](https://github.com/rails-api/active_model_serializers/pull/1557) Update docs regarding overriding the root key (@Jwan622)
- [#1471](https://github.com/rails-api/active_model_serializers/pull/1471) [Cleanup] Serializer caching is its own concern. (@bf4)
- [#1482](https://github.com/rails-api/active_model_serializers/pull/1482) Document JSON API implementation defs and progress in class. (@bf4)
- [#1551](https://github.com/rails-api/active_model_serializers/pull/1551) Added codebeat badge (@korzonek)
- [#1527](https://github.com/rails-api/active_model_serializers/pull/1527) Refactor fragment cache class. (@groyoh)
- [#1560](https://github.com/rails-api/active_model_serializers/pull/1560) Update rubocop and address its warnings. (@bf4 @groyoh)
- [#1545](https://github.com/rails-api/active_model_serializers/pull/1545) Document how to pass arbitrary options to the
  serializer (@CodedBeardedSignedTaylor)
- [#1496](https://github.com/rails-api/active_model_serializers/pull/1496) Run all branches against JRuby on CI (@nadavshatz)
- [#1559](https://github.com/rails-api/active_model_serializers/pull/1559) Add a deprecation DSL. (@bf4 @groyoh)
- [#1543](https://github.com/rails-api/active_model_serializers/pull/1543) Add the changes missing from #1535. (@groyoh)
- [#1535](https://github.com/rails-api/active_model_serializers/pull/1535) Move the adapter and adapter folder to
  active_model_serializers folder and changes the module namespace. (@domitian @bf4)
- [#1497](https://github.com/rails-api/active_model_serializers/pull/1497) Add JRuby-9000 to appveyor.yml(@corainchicago)
- [#1420](https://github.com/rails-api/active_model_serializers/pull/1420) Adds tests and documentation for polymorphism(@marcgarreau)

### v0.10.0.rc4 (2016/01/27 11:00 +00:00)
Breaking changes:

- [#1360](https://github.com/rails-api/active_model_serializers/pull/1360)
  [#1369](https://github.com/rails-api/active_model_serializers/pull/1369) Drop support for Ruby 1.9.3 (@karaAJC, @maurogeorge)
- [#1131](https://github.com/rails-api/active_model_serializers/pull/1131) Remove Serializer#root_name (@beauby)
- [#1138](https://github.com/rails-api/active_model_serializers/pull/1138) Introduce Adapter::Base (@bf4)
  * Adapters now inherit Adapter::Base. 'Adapter' is now a module, no longer a class.
    * using a class as a namespace that you also inherit from is complicated and circular at times i.e.
      buggy (see https://github.com/rails-api/active_model_serializers/pull/1177)
    * The class methods on Adapter aren't necessarily related to the instance methods, they're more
        Adapter functions.
    * named `Base` because it's a Rails-ism.
    * It helps to isolate and highlight what the Adapter interface actually is.
- [#1418](https://github.com/rails-api/active_model_serializers/pull/1418)
  serialized collections now use the root option as is; now, only the
  root derived from the serializer or object is always pluralized.

Features:

- [#1406](https://github.com/rails-api/active_model_serializers/pull/1406) Allow for custom dynamic values in JSON API links (@beauby)
- [#1270](https://github.com/rails-api/active_model_serializers/pull/1270) Adds `assert_response_schema` test helper (@maurogeorge)
- [#1099](https://github.com/rails-api/active_model_serializers/pull/1099) Adds `assert_serializer` test helper (@maurogeorge)
- [#1403](https://github.com/rails-api/active_model_serializers/pull/1403) Add support for if/unless on attributes/associations (@beauby)
- [#1248](https://github.com/rails-api/active_model_serializers/pull/1248) Experimental: Add support for JSON API deserialization (@beauby)
- [#1378](https://github.com/rails-api/active_model_serializers/pull/1378) Change association blocks
  to be evaluated in *serializer* scope, rather than *association* scope. (@bf4)
    * Syntax changes from e.g.
      `has_many :titles do customers.pluck(:title) end` (in #1356) to
      `has_many :titles do object.customers.pluck(:title) end`
- [#1356](https://github.com/rails-api/active_model_serializers/pull/1356) Add inline syntax for
  attributes and associations (@bf4 @beauby @noahsilas)
  * Allows defining attributes so that they don't conflict with existing methods. e.g. `attribute
      :title do 'Mr. Topum Hat' end`
  * Allows defining associations so that they don't conflict with existing methods. e.g. `has_many
      :titles do customers.pluck(:title) end`
    * Allows dynamic associations, as compared to compare to using
        [`virtual_value`](https://github.com/rails-api/active_model_serializers/pull/1356#discussion_r47146466).
        e.g. `has_many :reviews, virtual_value: [{ id: 1 }, { id: 2 }]`
  * Removes dynamically defined methods on the serializer
- [#1336](https://github.com/rails-api/active_model_serializers/pull/1336) Added support for Grape >= 0.13, < 1.0 (@johnhamelink)
- [#1322](https://github.com/rails-api/active_model_serializers/pull/1322) Instrumenting rendering of resources (@bf4, @maurogeorge)
- [#1291](https://github.com/rails-api/active_model_serializers/pull/1291) Add logging (@maurogeorge)
- [#1272](https://github.com/rails-api/active_model_serializers/pull/1272) Add PORO serializable base class: ActiveModelSerializers::Model (@bf4)
- [#1255](https://github.com/rails-api/active_model_serializers/pull/1255) Make more class attributes inheritable (@bf4)
- [#1249](https://github.com/rails-api/active_model_serializers/pull/1249) Inheritance of serializer inheriting the cache configuration(@Rodrigora)
- [#1247](https://github.com/rails-api/active_model_serializers/pull/1247) Add support for toplevel JSON API links (@beauby)
- [#1246](https://github.com/rails-api/active_model_serializers/pull/1246) Add support for resource-level JSON API links (@beauby)
- [#1225](https://github.com/rails-api/active_model_serializers/pull/1225) Better serializer lookup, use nested serializer when it exists (@beauby)
- [#1213](https://github.com/rails-api/active_model_serializers/pull/1213) `type` directive for serializer to control type field with json-api adapter (@youroff)
- [#1172](https://github.com/rails-api/active_model_serializers/pull/1172) Better serializer registration, get more than just the first module (@bf4)
- [#1158](https://github.com/rails-api/active_model_serializers/pull/1158) Add support for wildcards in `include` option (@beauby)
- [#1127](https://github.com/rails-api/active_model_serializers/pull/1127) Add support for nested
    associations for JSON and Attributes adapters via the `include` option (@NullVoxPopuli, @beauby).
- [#1050](https://github.com/rails-api/active_model_serializers/pull/1050) Add support for toplevel jsonapi member (@beauby, @bf4)
- [#1251](https://github.com/rails-api/active_model_serializers/pull/1251) Rename ArraySerializer to
    CollectionSerializer for clarity, add ActiveModelSerializers.config.collection_serializer (@bf4)
- [#1295](https://github.com/rails-api/active_model_serializers/pull/1295) Add config `serializer_lookup_enabled` that,
  when disabled, requires serializers to explicitly specified. (@trek)

Fixes:

- [#1352](https://github.com/rails-api/active_model_serializers/pull/1352) Fix generators; Isolate Rails-specifc code in Railties (@dgynn, @bf4)
- [#1384](https://github.com/rails-api/active_model_serializers/pull/1384)Fix database state leaking across tests (@bf4)
- [#1297](https://github.com/rails-api/active_model_serializers/pull/1297) Fix `fields` option to restrict relationships as well (@beauby)
- [#1239](https://github.com/rails-api/active_model_serializers/pull/1239) Fix duplicates in JSON API compound documents (@beauby)
- [#1214](https://github.com/rails-api/active_model_serializers/pull/1214) retrieve the key from the reflection options when building associations (@NullVoxPopuli, @hut8)
- [#1358](https://github.com/rails-api/active_model_serializers/pull/1358) Handle serializer file paths with spaces (@rwstauner, @bf4)
- [#1195](https://github.com/rails-api/active_model_serializers/pull/1195) Fix id override (@beauby)
- [#1185](https://github.com/rails-api/active_model_serializers/pull/1185) Fix options passing in Json and Attributes adapters (@beauby)

Misc:

- [#1383](https://github.com/rails-api/active_model_serializers/pull/1383) Simplify reflections handling (@beauby)
- [#1370](https://github.com/rails-api/active_model_serializers/pull/1370) Simplify attributes handling via a mixin (@beauby)
- [#1301](https://github.com/rails-api/active_model_serializers/pull/1301) Mapping JSON API spec / schema to AMS (@bf4)
- [#1271](https://github.com/rails-api/active_model_serializers/pull/1271) Handle no serializer source file to digest (@bf4)
- [#1260](https://github.com/rails-api/active_model_serializers/pull/1260) Serialization and Cache Documentation (@bf4)
- [#1259](https://github.com/rails-api/active_model_serializers/pull/1259) Add more info to CONTRIBUTING (@bf4)
- [#1233](https://github.com/rails-api/active_model_serializers/pull/1233) Top-level meta and meta_key options no longer handled at serializer level (@beauby)
- [#1232](https://github.com/rails-api/active_model_serializers/pull/1232) fields option no longer handled at serializer level (@beauby)
- [#1220](https://github.com/rails-api/active_model_serializers/pull/1220) Remove empty rubocop.rake (@maurogeorge)
- [#1178](https://github.com/rails-api/active_model_serializers/pull/1178) env CAPTURE_STDERR=false lets devs see hard failures (@bf4)
- [#1177](https://github.com/rails-api/active_model_serializers/pull/1177) Remove Adapter autoloads in favor of require (@bf4)
- [#1117](https://github.com/rails-api/active_model_serializers/pull/1117) FlattenJson adapter no longer inherits Json adapter, renamed to Attributes (@bf4)
- [#1171](https://github.com/rails-api/active_model_serializers/pull/1171) add require statements to top of file (@shicholas)
- [#1167](https://github.com/rails-api/active_model_serializers/pull/1167) Delegate Serializer.attributes to Serializer.attribute (@bf4)
- [#1174](https://github.com/rails-api/active_model_serializers/pull/1174) Consistently refer to the 'JSON API' and the 'JsonApi' adapter (@bf4)
- [#1173](https://github.com/rails-api/active_model_serializers/pull/1173) Comment private accessor warnings (@bf4)
- [#1166](https://github.com/rails-api/active_model_serializers/pull/1166) Prefer methods over instance variables (@bf4)
- [#1168](https://github.com/rails-api/active_model_serializers/pull/1168) Fix appveyor failure cache not being expired (@bf4)
- [#1161](https://github.com/rails-api/active_model_serializers/pull/1161) Remove duplicate test helper (@bf4)
- [#1360](https://github.com/rails-api/active_model_serializers/pull/1360) Update CI to test 2.2.2 -> 2.2.3 (@karaAJC)
- [#1371](https://github.com/rails-api/active_model_serializers/pull/1371) Refactor, update, create documentation (@bf4)

### v0.10.0.rc3 (2015/09/16 15:19 +00:00)
- [#1129](https://github.com/rails-api/active_model_serializers/pull/1129) Remove SerializableResource.serialize in favor of `.new` (@bf4)
- [#1155](https://github.com/rails-api/active_model_serializers/pull/1155) Outside controller use tutorial (@CodedBeardedSignedTaylor)
- [#1154](https://github.com/rails-api/active_model_serializers/pull/1154) Rubocop fixes for issues introduced by #1089 (@NullVoxPopuli)
- [#1089](https://github.com/rails-api/active_model_serializers/pull/1089) Add ActiveModelSerializers.logger with default null device (@bf4)
- [#1109](https://github.com/rails-api/active_model_serializers/pull/1109) Make better use of Minitest's lifecycle (@bf4)
- [#1144](https://github.com/rails-api/active_model_serializers/pull/1144) Fix Markdown to adapters documentation (@bacarini)
- [#1121](https://github.com/rails-api/active_model_serializers/pull/1121) Refactor `add_links` in JSONAPI adapter. (@beauby)
- [#1150](https://github.com/rails-api/active_model_serializers/pull/1150) Remove legacy method accidentally reintroduced in #1017 (@beauby)
- [#1149](https://github.com/rails-api/active_model_serializers/pull/1149) Update README with nested included association example. (@mattmueller)
- [#1110](https://github.com/rails-api/active_model_serializers/pull/1110) Add lint tests for AR models (@beauby)
- [#1131](https://github.com/rails-api/active_model_serializers/pull/1131) Extended format for JSONAPI `include` option (@beauby)
  * adds extended format for `include` option to JsonApi adapter
- [#1142](https://github.com/rails-api/active_model_serializers/pull/1142) Updating wording on cache expiry in README (@leighhalliday)
- [#1140](https://github.com/rails-api/active_model_serializers/pull/1140) Fix typo in fieldset exception (@lautis)
- [#1132](https://github.com/rails-api/active_model_serializers/pull/1132) Get rid of unnecessary instance variables, and implied dependencies. (@beauby)
- [#1139](https://github.com/rails-api/active_model_serializers/pull/1139) Documentation for serializing resources without render (@PericlesTheo)
- [#1017](https://github.com/rails-api/active_model_serializers/pull/1017) Make Adapters registerable so they are not namespace-constrained (@bf4)
- [#1120](https://github.com/rails-api/active_model_serializers/pull/1120) Add windows platform to loading sqlite3 (@Eric-Guo)
- [#1123](https://github.com/rails-api/active_model_serializers/pull/1123) Remove url options (@bacarini)
- [#1093](https://github.com/rails-api/active_model_serializers/pull/1093) Factor `with_adapter` + force cache clear before each test. (@beauby)
- [#1095](https://github.com/rails-api/active_model_serializers/pull/1095) Add documentation about configuration options. (@beauby)
- [#1069](https://github.com/rails-api/active_model_serializers/pull/1069) Add test coverage; account for no artifacts on CI (@bf4)
- [#1103](https://github.com/rails-api/active_model_serializers/pull/1103) Move `id` and `json_api_type` methods from `Serializer` to `JsonApi`. (@beauby)
- [#1106](https://github.com/rails-api/active_model_serializers/pull/1106) Add Style enforcer (via Rubocop) (@bf4)
- [#1079](https://github.com/rails-api/active_model_serializers/pull/1079) Add ArraySerializer#object like Serializer (@bf4)
- [#1096](https://github.com/rails-api/active_model_serializers/pull/1096) Fix definition of serializer attributes with multiple calls to `attri… (@beauby)
- [#1105](https://github.com/rails-api/active_model_serializers/pull/1105) Add ActiveRecord-backed fixtures. (@beauby)
- [#1108](https://github.com/rails-api/active_model_serializers/pull/1108) Better lint (@bf4)
- [#1102](https://github.com/rails-api/active_model_serializers/pull/1102) Remove remains of `embed` option. (@beauby)
- [#1090](https://github.com/rails-api/active_model_serializers/pull/1090) Clarify AMS dependencies (@bf4)
- [#1081](https://github.com/rails-api/active_model_serializers/pull/1081) Add configuration option to set resource type to singular/plural (@beauby)
- [#1067](https://github.com/rails-api/active_model_serializers/pull/1067) Fix warnings (@bf4)
- [#1066](https://github.com/rails-api/active_model_serializers/pull/1066) Adding appveyor to the project (@joaomdmoura, @Eric-Guo, @bf4)
- [#1071](https://github.com/rails-api/active_model_serializers/pull/1071) Make testing suite running and pass in Windows (@Eric-Guo, @bf4)
- [#1041](https://github.com/rails-api/active_model_serializers/pull/1041) Adding pagination links (@bacarini)
  * adds support for `pagination links` at top level of JsonApi adapter
- [#1063](https://github.com/rails-api/active_model_serializers/pull/1063) Lead by example: lint PORO model (@bf4)
- [#1](https://github.com/rails-api/active_model_serializers/pull/1) Test caller line parsing and digesting (@bf4)
- [#1048](https://github.com/rails-api/active_model_serializers/pull/1048) Let FlattenJson adapter decide it doesn't include meta (@bf4)
- [#1060](https://github.com/rails-api/active_model_serializers/pull/1060) Update fragment cache to support namespaced objects (@aaronlerch)
- [#1052](https://github.com/rails-api/active_model_serializers/pull/1052) Use underscored json_root when serializing a collection (@whatthewhat)
- [#1051](https://github.com/rails-api/active_model_serializers/pull/1051) Fix some invalid JSON in docs (@tjschuck)
- [#1049](https://github.com/rails-api/active_model_serializers/pull/1049) Fix incorrect s/options = {}/options ||= {} (@bf4)
- [#1037](https://github.com/rails-api/active_model_serializers/pull/1037) allow for type attribute (@lanej)
- [#1034](https://github.com/rails-api/active_model_serializers/pull/1034) allow id attribute to be overriden (@lanej)
- [#1035](https://github.com/rails-api/active_model_serializers/pull/1035) Fixed Comments highlight (@artLopez)
- [#1031](https://github.com/rails-api/active_model_serializers/pull/1031) Disallow to define multiple associations at once (@bolshakov)
- [#1032](https://github.com/rails-api/active_model_serializers/pull/1032) Wrap railtie requirement with rescue (@elliotlarson)
- [#1026](https://github.com/rails-api/active_model_serializers/pull/1026) Bump Version Number to 0.10.0.rc2 (@jfelchner)
- [#985](https://github.com/rails-api/active_model_serializers/pull/985) Associations implementation refactoring (@bolshakov)
- [#954](https://github.com/rails-api/active_model_serializers/pull/954) Encapsulate serialization in ActiveModel::SerializableResource (@bf4)
- [#972](https://github.com/rails-api/active_model_serializers/pull/972) Capture app warnings on test run (@bf4)
- [#1019](https://github.com/rails-api/active_model_serializers/pull/1019) Improve README.md (@baojjeu)
- [#998](https://github.com/rails-api/active_model_serializers/pull/998) Changing root to model class name (@joaomdmoura)
- [#1006](https://github.com/rails-api/active_model_serializers/pull/1006) Fix adapter inflection bug for api -> API (@bf4)
- [#1016](https://github.com/rails-api/active_model_serializers/pull/1016) require rails/railtie before subclassing Rails::Railtie (@bf4)
- [#1013](https://github.com/rails-api/active_model_serializers/pull/1013) Root option with empty array support (@vyrak, @mareczek)
- [#994](https://github.com/rails-api/active_model_serializers/pull/994) Starting Docs structure (@joaomdmoura)
- [#1007](https://github.com/rails-api/active_model_serializers/pull/1007) Bug fix for ArraySerializer json_key (@jiajiawang)
- [#1003](https://github.com/rails-api/active_model_serializers/pull/1003) Fix transient test failures (@Rodrigora)
- [#996](https://github.com/rails-api/active_model_serializers/pull/996) Add linter for serializable resource (@bf4)
- [#990](https://github.com/rails-api/active_model_serializers/pull/990) Adding json-api meta test (@joaomdmoura)
- [#984](https://github.com/rails-api/active_model_serializers/pull/984) Add option "key" to serializer associations (@Rodrigora)
- [#982](https://github.com/rails-api/active_model_serializers/pull/982) Fix typo (@bf4)
- [#981](https://github.com/rails-api/active_model_serializers/pull/981) Remove unused PORO#to_param (@bf4)
- [#978](https://github.com/rails-api/active_model_serializers/pull/978) fix generators template bug (@regonn)
- [#975](https://github.com/rails-api/active_model_serializers/pull/975) Fixes virtual value not being used (@GriffinHeart)
- [#970](https://github.com/rails-api/active_model_serializers/pull/970) Fix transient tests failures (@Rodrigora)
- [#962](https://github.com/rails-api/active_model_serializers/pull/962) Rendering objects that doesn't have serializers (@bf4, @joaomdmoura, @JustinAiken)
- [#939](https://github.com/rails-api/active_model_serializers/pull/939) Use a more precise generated cache key (@aaronlerch)
- [#971](https://github.com/rails-api/active_model_serializers/pull/971) Restore has_one to generator (@bf4)
- [#965](https://github.com/rails-api/active_model_serializers/pull/965) options fedault valueserializable_hash and as_json (@bf4)
- [#959](https://github.com/rails-api/active_model_serializers/pull/959) TYPO on README.md (@kangkyu)

### v0.10.0.rc2 (2015/06/16 21:30 +00:00)
- [#958](https://github.com/rails-api/active_model_serializers/pull/958) Splitting json adapter into two (@joaomdmoura)
  * adds FlattenJSON as default adapter
- [#953](https://github.com/rails-api/active_model_serializers/pull/953) use model name to determine the type (@lsylvester)
  * uses model name to determine the type
- [#949](https://github.com/rails-api/active_model_serializers/pull/949) Don't pass serializer option to associated serializers (@bf4, @edwardloveall)
- [#902](https://github.com/rails-api/active_model_serializers/pull/902) Added serializer file digest to the cache_key (@cristianbica)
- [#948](https://github.com/rails-api/active_model_serializers/pull/948) AMS supports JSONAPI 1.0 instead of RC4 (@SeyZ)
- [#936](https://github.com/rails-api/active_model_serializers/pull/936) Include meta when using json adapter with custom root (@chrisbranson)
- [#942](https://github.com/rails-api/active_model_serializers/pull/942) Small code styling issue (@thiagofm)
- [#930](https://github.com/rails-api/active_model_serializers/pull/930) Reverting PR #909 (@joaomdmoura)
- [#924](https://github.com/rails-api/active_model_serializers/pull/924) Avoid unecessary calls to attribute methods when fragment caching (@navinpeiris)
- [#925](https://github.com/rails-api/active_model_serializers/pull/925) Updates JSON API Adapter to generate RC4 schema (@benedikt)
  * adds JSON API support 1.0
- [#918](https://github.com/rails-api/active_model_serializers/pull/918) Adding rescue_with_handler to clear state (@ryansch)
- [#909](https://github.com/rails-api/active_model_serializers/pull/909) Defining Json-API Adapter as Default (@joaomdmoura)
  * remove root key option and split JSON adapter
- [#914](https://github.com/rails-api/active_model_serializers/pull/914) Prevent possible duplicated attributes in serializer (@groyoh)
- [#880](https://github.com/rails-api/active_model_serializers/pull/880) Inabling subclasses serializers to inherit attributes (@groyoh)
- [#913](https://github.com/rails-api/active_model_serializers/pull/913) Avoiding the serializer option when instantiating a new one for ArraySerializer Fixed #911 (@groyoh)
- [#897](https://github.com/rails-api/active_model_serializers/pull/897) Allow to define custom serializer for given class (@imanel)
- [#892](https://github.com/rails-api/active_model_serializers/pull/892) Fixed a bug that appeared when json adapter serialize a nil association (@groyoh)
- [#895](https://github.com/rails-api/active_model_serializers/pull/895) Adding a test to cover 'meta' and 'meta_key' attr_readers (@adomokos)
- [#894](https://github.com/rails-api/active_model_serializers/pull/894) Fixing typos in README.md (@adomokos)
- [#888](https://github.com/rails-api/active_model_serializers/pull/888) Changed duplicated test name in action controller test (@groyoh)
- [#890](https://github.com/rails-api/active_model_serializers/pull/890) Remove unused method `def_serializer` (@JustinAiken)
- [#887](https://github.com/rails-api/active_model_serializers/pull/887) Fixing tests on JRuby (@joaomdmoura)
- [#885](https://github.com/rails-api/active_model_serializers/pull/885) Updates rails versions for test and dev (@tonyta)

### v0.10.0.rc1 (2015/04/22 06:06 +00:00)
- [#810](https://github.com/rails-api/active_model_serializers/pull/810) Adding Fragment Cache to AMS (@joaomdmoura)
  * adds fragment cache support
- [#868](https://github.com/rails-api/active_model_serializers/pull/868) Fixed a bug that appears when a nil association is included (@groyoh)
- [#861](https://github.com/rails-api/active_model_serializers/pull/861) README: Add emphasis to single-word difference (@machty)
- [#858](https://github.com/rails-api/active_model_serializers/pull/858) Included resource fixes (@mateomurphy)
- [#853](https://github.com/rails-api/active_model_serializers/pull/853) RC3 Updates for JSON API (@mateomurphy)
- [#852](https://github.com/rails-api/active_model_serializers/pull/852) Fix options merge order in `each_association` (@mateomurphy)
- [#850](https://github.com/rails-api/active_model_serializers/pull/850) Use association value for determining serializer used (@mateomurphy)
- [#843](https://github.com/rails-api/active_model_serializers/pull/843) Remove the mailing list from the README (@JoshSmith)
- [#842](https://github.com/rails-api/active_model_serializers/pull/842) Add notes on how you can help to contributing documentation (@JoshSmith)
- [#833](https://github.com/rails-api/active_model_serializers/pull/833) Cache serializers for class (@lsylvester)
- [#837](https://github.com/rails-api/active_model_serializers/pull/837) Store options in array serializers (@kurko)
- [#836](https://github.com/rails-api/active_model_serializers/pull/836) Makes passed in options accessible inside serializers (@kurko)
- [#773](https://github.com/rails-api/active_model_serializers/pull/773) Make json api adapter 'include' option accept an array (@sweatypitts)
- [#830](https://github.com/rails-api/active_model_serializers/pull/830) Add contributing readme (@JoshSmith)
- [#811](https://github.com/rails-api/active_model_serializers/pull/811) Reimplement serialization scope and scope_name (@mateomurphy)
- [#725](https://github.com/rails-api/active_model_serializers/pull/725) Support has_one to be compatible with 0.8.x (@ggordon)
  * adds `has_one` attribute for backwards compatibility
- [#822](https://github.com/rails-api/active_model_serializers/pull/822) Replace has_one with attribute in template (@bf4)
- [#821](https://github.com/rails-api/active_model_serializers/pull/821) Fix explicit serializer for associations (@wjordan)
- [#798](https://github.com/rails-api/active_model_serializers/pull/798) Fix lost test `test_include_multiple_posts_and_linked` (@donbobka)
- [#807](https://github.com/rails-api/active_model_serializers/pull/807) Add Overriding attribute methods section to README. (@alexstophel)
- [#693](https://github.com/rails-api/active_model_serializers/pull/693) Cache Support at AMS 0.10.0 (@joaomdmoura)
  * adds cache support to attributes and associations.
- [#792](https://github.com/rails-api/active_model_serializers/pull/792) Association overrides (@kurko)
  * adds method to override association
- [#794](https://github.com/rails-api/active_model_serializers/pull/794) add to_param for correct URL generation (@carlesjove)

### v0.10.0-pre

- [Introduce Adapter](https://github.com/rails-api/active_model_serializers/commit/f00fe5595ddf741dc26127ed8fe81adad833ead5)
- Prefer `ActiveModel::Serializer` to `ActiveModelSerializers`:
  - [Namespace](https://github.com/rails-api/active_model_serializers/commit/729a823868e8c7ac86c653fcc7100ee511e08cb6#diff-fe7aa2941c19a41ccea6e52940d84016).
  - [README](https://github.com/rails-api/active_model_serializers/commit/4a2d9853ba7486acc1747752982aa5650e7fd6e9).

## 0.09.x

### v0.9.3 (2015/01/21 20:29 +00:00)

Features:
- [#774](https://github.com/rails-api/active_model_serializers/pull/774) Fix nested include attributes (@nhocki)
- [#771](https://github.com/rails-api/active_model_serializers/pull/771) Make linked resource type names consistent with root names (@sweatypitts)
- [#696](https://github.com/rails-api/active_model_serializers/pull/696) Explicitly set serializer for associations (@ggordon)
- [#700](https://github.com/rails-api/active_model_serializers/pull/700) sparse fieldsets (@arenoir)
- [#768](https://github.com/rails-api/active_model_serializers/pull/768) Adds support for `meta` and `meta_key` attribute (@kurko)

### v0.9.1 (2014/12/04 11:54 +00:00)
- [#707](https://github.com/rails-api/active_model_serializers/pull/707) A Friendly Note on Which AMS Version to Use (@jherdman)
- [#730](https://github.com/rails-api/active_model_serializers/pull/730) Fixes nested has_many links in JSONAPI (@kurko)
- [#718](https://github.com/rails-api/active_model_serializers/pull/718) Allow overriding the adapter with render option (@ggordon)
- [#720](https://github.com/rails-api/active_model_serializers/pull/720) Rename attribute with :key (0.8.x compatibility) (@ggordon)
- [#728](https://github.com/rails-api/active_model_serializers/pull/728) Use type as key for linked resources (@kurko)
- [#729](https://github.com/rails-api/active_model_serializers/pull/729) Use the new beta build env on Travis (@joshk)
- [#703](https://github.com/rails-api/active_model_serializers/pull/703) Support serializer and each_serializer options in renderer (@ggordon, @mieko)
- [#727](https://github.com/rails-api/active_model_serializers/pull/727) Includes links inside of linked resources (@kurko)
- [#726](https://github.com/rails-api/active_model_serializers/pull/726) Bugfix: include nested has_many associations (@kurko)
- [#722](https://github.com/rails-api/active_model_serializers/pull/722) Fix infinite recursion (@ggordon)
- [#1](https://github.com/rails-api/active_model_serializers/pull/1) Allow for the implicit use of ArraySerializer when :each_serializer is specified (@mieko)
- [#692](https://github.com/rails-api/active_model_serializers/pull/692) Include 'linked' member for json-api collections (@ggordon)
- [#714](https://github.com/rails-api/active_model_serializers/pull/714) Define as_json instead of to_json (@guilleiguaran)
- [#710](https://github.com/rails-api/active_model_serializers/pull/710) JSON-API: Don't include linked section if associations are empty (@guilleiguaran)
- [#711](https://github.com/rails-api/active_model_serializers/pull/711) Fixes rbx gems bundling on TravisCI (@kurko)
- [#709](https://github.com/rails-api/active_model_serializers/pull/709) Add type key when association name is different than object type (@guilleiguaran)
- [#708](https://github.com/rails-api/active_model_serializers/pull/708) Handle correctly null associations (@guilleiguaran)
- [#691](https://github.com/rails-api/active_model_serializers/pull/691) Fix embed option for associations (@jacob-s-son)
- [#689](https://github.com/rails-api/active_model_serializers/pull/689) Fix support for custom root in JSON-API adapter (@guilleiguaran)
- [#685](https://github.com/rails-api/active_model_serializers/pull/685) Serialize ids as strings in JSON-API adapter (@guilleiguaran)
- [#684](https://github.com/rails-api/active_model_serializers/pull/684) Refactor adapters to implement support for array serialization (@guilleiguaran)
- [#682](https://github.com/rails-api/active_model_serializers/pull/682) Include root by default in JSON-API serializers (@guilleiguaran)
- [#625](https://github.com/rails-api/active_model_serializers/pull/625) Add DSL for urls (@JordanFaust)
- [#677](https://github.com/rails-api/active_model_serializers/pull/677) Add support for embed: :ids option for in associations (@guilleiguaran)
- [#681](https://github.com/rails-api/active_model_serializers/pull/681) Check superclasses for Serializers (@quainjn)
- [#680](https://github.com/rails-api/active_model_serializers/pull/680) Add support for root keys (@NullVoxPopuli)
- [#675](https://github.com/rails-api/active_model_serializers/pull/675) Support Rails 4.2.0 (@tricknotes)
- [#667](https://github.com/rails-api/active_model_serializers/pull/667) Require only activemodel instead of full rails (@guilleiguaran)
- [#653](https://github.com/rails-api/active_model_serializers/pull/653) Add "_test" suffix to JsonApi::HasManyTest filename. (@alexgenco)
- [#631](https://github.com/rails-api/active_model_serializers/pull/631) Update build badge URL (@craiglittle)

### 0.9.0.alpha1 - January 7, 2014

### 0.9.0.pre

* The following methods were removed
  - Model#active\_model\_serializer
  - Serializer#include!
  - Serializer#include?
  - Serializer#attr\_disabled=
  - Serializer#cache
  - Serializer#perform\_caching
  - Serializer#schema (needs more discussion)
  - Serializer#attribute
  - Serializer#include\_#{name}? (filter method added)
  - Serializer#attributes (took a hash)

* The following things were added
  - Serializer#filter method
  - CONFIG object

* Remove support for ruby 1.8 versions.

* Require rails >= 3.2.

* Serializers for associations are being looked up in a parent serializer's namespace first. Same with controllers' namespaces.

* Added a "prefix" option in case you want to use a different version of serializer.

* Serializers default namespace can be set in `default_serializer_options` and inherited by associations.

* [Beginning of rewrite: c65d387705ec534db171712671ba7fcda4f49f68](https://github.com/rails-api/active_model_serializers/commit/c65d387705ec534db171712671ba7fcda4f49f68)

## 0.08.x

### v0.8.3 (2014/12/10 14:45 +00:00)
- [#753](https://github.com/rails-api/active_model_serializers/pull/753) Test against Ruby 2.2 on Travis CI (@tricknotes)
- [#745](https://github.com/rails-api/active_model_serializers/pull/745) Missing a word (@jockee)

### v0.8.2 (2014/09/01 21:00 +00:00)
- [#612](https://github.com/rails-api/active_model_serializers/pull/612) Feature/adapter (@bolshakov)
  * adds adapters pattern
- [#615](https://github.com/rails-api/active_model_serializers/pull/615) Rails does not support const_defined? in development mode (@tpitale)
- [#613](https://github.com/rails-api/active_model_serializers/pull/613) README: typo fix on attributes (@spk)
- [#614](https://github.com/rails-api/active_model_serializers/pull/614) Fix rails 4.0.x build. (@arthurnn)
- [#610](https://github.com/rails-api/active_model_serializers/pull/610) ArraySerializer (@bolshakov)
- [#607](https://github.com/rails-api/active_model_serializers/pull/607) ruby syntax highlights (@zigomir)
- [#602](https://github.com/rails-api/active_model_serializers/pull/602) Add DSL for associations (@JordanFaust)

### 0.8.1 (May 6, 2013)

* Fix bug whereby a serializer using 'options' would blow up.

### 0.8.0 (May 5, 2013)

* Attributes can now have optional types.

* A new DefaultSerializer ensures that POROs behave the same way as ActiveModels.

* If you wish to override ActiveRecord::Base#to_Json, you can now require
  'active_record/serializer_override'. We don't recommend you do this, but
  many users do, so we've left it optional.

* Fixed a bug where ActionController wouldn't always have MimeResponds.

* An optinal caching feature allows you to cache JSON & hashes that AMS uses.
  Adding 'cached true' to your Serializers will turn on this cache.

* URL helpers used inside of Engines now work properly.

* Serializers now can filter attributes with `only` and `except`:

  ```
  UserSerializer.new(user, only: [:first_name, :last_name])
  UserSerializer.new(user, except: :first_name)
  ```

* Basic Mongoid support. We now include our mixins in the right place.

* On Ruby 1.8, we now generate an `id` method that properly serializes `id`
  columns. See issue #127 for more.

* Add an alias for `scope` method to be the name of the context. By default
  this is `current_user`. The name is automatically set when using
  `serialization_scope` in the controller.

* Pass through serialization options (such as `:include`) when a model
  has no serializer defined.

## [0.7.0 (March 6, 2013)](https://github.com/rails-api/active_model_serializers/commit/fabdc621ff97fbeca317f6301973dd4564b9e695)

* ```embed_key``` option to allow embedding by attributes other than IDs
* Fix rendering nil with custom serializer
* Fix global ```self.root = false```
* Add support for specifying the serializer for an association as a String
* Able to specify keys on the attributes method
* Serializer Reloading via ActiveSupport::DescendantsTracker
* Reduce double map to once; Fixes datamapper eager loading.

## 0.6.0 (October 22, 2012)

* Serialize sets properly
* Add root option to ArraySerializer
* Support polymorphic associations
* Support :each_serializer in ArraySerializer
* Add `scope` method to easily access the scope in the serializer
* Fix regression with Rails 3.2.6; add Rails 4 support
* Allow serialization_scope to be disabled with serialization_scope nil
* Array serializer should support pure ruby objects besides serializers

## 0.05.x

### [0.5.2 (June 5, 2012)](https://github.com/rails-api/active_model_serializers/commit/615afd125c260432d456dc8be845867cf87ea118#diff-0c5c12f311d3b54734fff06069efd2ac)

### [0.5.1 (May 23, 2012)](https://github.com/rails-api/active_model_serializers/commit/00194ec0e41831802fcbf893a34c0bb0853ebe14#diff-0c5c12f311d3b54734fff06069efd2ac)

### [0.5.0 (May 16, 2012)](https://github.com/rails-api/active_model_serializers/commit/33d4842dcd35c7167b0b33fc0abcf00fb2c92286)

* First tagged version
* Changes generators to always generate an ApplicationSerializer

## [0.1.0 (December 21, 2011)](https://github.com/rails-api/active_model_serializers/commit/1e0c9ef93b96c640381575dcd30be07ac946818b)

## First Commit as [Rails Serializers 0.0.1](https://github.com/rails-api/active_model_serializers/commit/d72b66d4c5355b0ff0a75a04895fcc4ea5b0c65e)
  (December 1, 2011).

## Prehistory

- [Changing Serialization/Serializers namespace to `Serializable` (November 30, 2011)](https://github.com/rails/rails/commit/8896b4fdc8a543157cdf4dfc378607ebf6c10ab0)
  - [Merge branch 'serializers'. This implements the ActiveModel::Serializer object. Includes code, tests, generators and guides. From José and Yehuda with love.](https://github.com/rails/rails/commit/fcacc6986ab60f1fb2e423a73bf47c7abd7b191d)
  - But [was reverted](https://github.com/rails/rails/commit/5b2eb64ceb08cd005dc06b721935de5853971473).
    '[Revert the serializers API as other alternatives are now also under discussion](https://github.com/rails/rails/commit/0a4035b12a6c59253cb60f9e3456513c6a6a9d33)'.
- [Proposed Implementation to Rails 3.2 by @wycats and @josevalim (November 25, 2011)](https://github.com/rails/rails/pull/3753)
  - [Creation of `ActionController::Serialization`, initial serializer
    support (September, 26 2011)](https://github.com/rails/rails/commit/8ff7693a8dc61f43fc4eaf72ed24d3b8699191fe).
  - [Docs and CHANGELOG](https://github.com/rails/rails/commit/696d01f7f4a8ed787924a41cce6df836cd73c46f)
  - [Deprecation of ActiveModel::Serialization to ActiveModel::Serializable](https://github.com/rails/rails/blob/696d01f7f4a8ed787924a41cce6df836cd73c46f/activemodel/lib/active_model/serialization.rb)
- [Creation of `ActiveModel::Serialization` from `ActiveModel::Serializer` in Rails (2009)](https://github.com/rails/rails/commit/c6bc8e662614be711f45a8d4b231d5f993b024a7#diff-d029b9768d8df0407a35804a468e3ae5)
- [Integration of `ActiveModel::Serializer` into `ActiveRecord::Serialization`](https://github.com/rails/rails/commit/783db25e0c640c1588732967a87d65c10fddc08e)
- [Creation of `ActiveModel::Serializer` in Rails (2009)](https://github.com/rails/rails/commit/d2b78b3594b9cc9870e6a6ebfeb2e56d00e6ddb8#diff-80d5beeced9bdc24ca2b04a201543bdd)
- [Creation of `ActiveModel::Serializers::JSON` in Rails (2009)](https://github.com/rails/rails/commit/fbdf706fffbfb17731a1f459203d242414ef5086)
