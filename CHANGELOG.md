## 1.2.1

### Chores

- Replace the README's stale TODO list (most items shipped in 1.2.0)
  with a **Tested specs** section that records the real-world specs
  space_gen iterates against (GitHub, Discord, SpaceTraders, Train
  Travel, Petstore) and their current status. Add a "Powered by
  Shorebird" badge. Promote the OpenApi Quirks subsection to a
  top-level section. Still-real items from the old TODO that didn't
  already have tracking issues were filed as #204–#207.

## 1.2.0

### Features

- **`oneOf` / `anyOf` dispatch — full sealed-class generation.** Previously
  every `oneOf` body emitted `throw UnimplementedError` from the synthesized
  parent's `fromJson`. The renderer now picks one of five strategies and
  emits real Dart 3 pattern-matched dispatch:
  - **Discriminator dispatch** — explicit `discriminator: {propertyName,
    mapping}` switches on `json[propertyName]` (#143).
  - **Implicit-discriminator dispatch** — when each variant tags itself with
    a required single-value enum/const property (or per-variant
    pairwise-disjoint enum value sets), dispatch on it as if a
    discriminator were declared (#149, #182).
  - **Shape dispatch** — variants of distinct JSON shapes
    (`int`/`String`/`bool`/`Map`/`List`/`num`) switch on the runtime type;
    extends through `RenderArray`, `RenderNumber`, and `RenderMap` variants
    (#145, #147, #151, #152).
  - **Required-field / property-presence dispatch** — object variants with
    a uniquely-required (or uniquely-optional) field generate an if-chain
    over `containsKey`. A variant with no required fields can act as the
    catch-all fallback (#146, #153, #154).
  - **Hybrid dispatch** — mixed-shape `oneOf`s combine an outer shape
    switch with required-field sub-arms inside `Map<String, dynamic>`,
    plus array-element shape sub-arms inside `List<dynamic>` (#156, #183).
  - **Array-element dispatch** — `anyOf<array<X>, array<Y>>` peeks the
    first list element to pick a variant (#159).
  - **Array-element-property shape dispatch** — for object-variant twins
    that share required keys but differ in the items shape of an array
    property (validation-error / validation-error-simple) (#177).
- **Smoosh: variant data classes inline directly into the sealed parent.**
  Previously each `oneOf` emitted a per-variant data class plus a wrapper
  subclass holding `final value: <DataClass>`. When a variant's pointer is
  exclusive to one parent, the variant data class itself becomes the sealed
  subclass, inlined in the parent's `.dart` file — no wrapper, no `value`
  indirection, pattern matching destructures the variant's fields directly.
  Covers predicate-required, discriminator, shape, hybrid, and inline
  `allOf` variants; also extends to top-level `$ref` variants used by
  exactly one parent (#168, #169, #170, #179, #189). Round-trip tests are
  synthesized for each smooshed variant (#181). Structurally-identical
  `oneOf` trees synthesized under operation paths share one resolved
  schema — one Dart class instead of multiple byte-identical sealed
  classes (#180).
- **HTTP-status dispatch on operations with multiple successful responses.**
  Operations declaring e.g. `200: User, 202: AcceptedJob` (or `201: Empty,
  204: ø`) used to coalesce into a discriminator-less `RenderOneOf` and
  throw `UnimplementedError`. Now emit a sealed parent with one `final`
  wrapper per status code; the api method body switches on
  `response.statusCode`. Empty-body and empty-schema 204s render as
  value-less / `dynamic`-valued wrappers respectively (#148).
- **Naming pass.** A single global pass owns every Dart class name the
  generator emits, including wrapper subclasses. Each entity submits a
  preference list (best/shortest first, longest/safest last); the new
  `NameAllocator` runs an order-independent fixpoint and disambiguates
  remaining collisions with numeric suffixes. Title-derived names land
  for inline `oneOf`/`anyOf` variants whose spec carries a unique
  `title:`. Wrappers no longer double-prefix
  (`ProjectsCreateCardRequestProjectsCreateCardRequestOneOf0` →
  `ProjectsCreateCardRequestVariant0`) (#161, #162, #163, #165, #166,
  #167).
- **Integer enums** (`type: integer, enum: [...]`) parse and render as
  typed `enum` classes with `valueN` variant names (`value1`, `valueNeg1`)
  via a new `SchemaEnum<T>` family pinning `T` to `String` or `int` (#192).
- **OpenAPI 3.1 `const`** parses as a single-value enum, equivalent to
  `enum: [X]`. Untyped `const` infers `integer` vs `string` from the
  value (#198). A `oneOf` whose every variant is a single-value `const`
  collapses to one typed enum class — eliminates 80 stub `UnimplementedError`
  factories on Discord-shaped specs (#200).
- **Newtype validation moves into the constructor.** A newtype with
  `pattern` / `minimum` / `maxLength` etc. is always valid by
  construction; `extension type const Foo._(String value)` gains a
  public constructor body that runs the validators. The synthesized
  round-trip test's example value is now schema-aware (regex-tested
  candidates, `minLength`/`maxLength`-resized) so it satisfies the
  schema's own rules. Per-call `validatePattern(...)` at API call sites
  is dropped for newtype params — 327 broken call sites in Discord's
  `default_api.dart` cleared (#194).
- **`contentEncoding: base64`** on a `type: string` property renders as
  `Uint8List` with `base64.encode` / `base64.decode` applied automatically
  at the JSON boundary; nullable cases route through new
  `maybeBase64Encode` / `maybeBase64Decode` helpers (#201).
- **`example:` and `examples:` on parameters and headers** thread through
  parse → resolve → render and surface in generated dartdoc as
  `/// [paramName] example: \`value\`` (scalars in backticks; Map/List
  in fenced ` ```json ` blocks). Schema examples use the same emission
  point (#178).
- **Inline `oneOf` / `anyOf` at property schema slots** are honored even
  when the property also declares `type: [null, string, integer]` — the
  explicit collection takes precedence over the multi-type expansion,
  preserving per-variant detail like `format: date-time` (#174).
- **Object schemas with required-only `oneOf` / `anyOf`** (every variant
  is `{required: [...]}` with no shape of its own) parse as a plain object
  with all properties optional; the xor constraint becomes a runtime
  concern (#155).
- **Pass-through bearer auth for `oauth2` and `openIdConnect`.** Both
  deliver opaque bearer tokens at the wire level; route them through
  `HttpSecurityScheme(scheme: 'bearer')` and reuse the existing bearer
  plumbing. Token acquisition (grants, OIDC discovery, refresh) stays
  the caller's responsibility via `ApiClient(readSecret: …)` (#126).
- **Non-JSON success responses** (`text/plain`, `text/html`,
  `application/octocat-stream`, …) return `response.body` directly
  instead of crashing in `jsonDecode`. JSON responses are unchanged
  (#127).
- **CLI auto-sanitizes invalid Dart package names.** `space_gen -i
  api.github.com.json -o /tmp/api.github.com` now succeeds; the package
  name lands as `api_github_com` and the CLI logs the substitution.
  Programmatic callers building `GeneratorConfig` directly still trip
  the `validatePackageName` safety net (#123).
- `space_gen` declares its `executables:` so `dart pub global activate
  space_gen` puts a `space_gen` command on PATH (#118).
- `example/` directory with a minimal petstore spec and CLI walkthrough,
  for pub.dev's package-scoring `example/` check (#117).
- Auto-publish to pub.dev on tag push via the canonical `dart-lang/setup-dart`
  reusable workflow with OIDC auth (#116).

### Bug fixes

- **Round-trip correctness for nullable `oneOf`, `EmptyObject`, and
  `additionalProperties`.** A nullable `oneOf` property emitted
  `as Map<String, dynamic>` (non-nullable) and crashed on null round-trip;
  `RenderEmptyObject` hard-coded `const $className()` on read and
  `const <String, dynamic>{}` on write, dropping inner state; the
  `additionalProperties` for-loop swept named-property keys into the
  catch-all `entries` field. Closes 41 pre-existing failing round-trip
  tests on the github regen (#184).
- **Required-and-nullable keys** (OpenAPI 3.1 `type: [T, "null"]` plus
  the property in `required`) now route through a new `checkedKey` helper
  that verifies `containsKey` before reading. Previously the generated
  `fromJson` silently accepted a missing key as null, contradicting the
  generated round-trip test (#121).
- **`allOf` synthesis merges required properties.** The
  `ResolvedAllOf → RenderObject` synthesis dropped each member's
  `requiredProperties` lists, silently making required fields nullable
  in the constructor and hiding required-property tags from `oneOf`
  dispatch detection (#150).
- **Don't drop properties / required when `oneOf` is a sibling.** A
  `type: object` schema with both `properties` / `required` AND
  `oneOf` / `anyOf` siblings used to flip into oneOf-mode and lose the
  parent's fields; now merges them into each variant at parse time when
  every variant inline-refines the parent (#182).
- **Multi-status sealed wrapper name collision.** When a top-level
  schema and a multi-status operation's synthesized response wrapper
  shared a name (e.g. `ThreadSearchResponse`), the renderer hard-computed
  the wrapper class name without going through the naming pass — the
  allocator's collision suffix wasn't applied. Wrapper names now consult
  the allocator (#196).
- **Array query / header parameters** serialize per OpenAPI defaults:
  query (`style=form, explode=true`) emits `?key=v1&key=v2`; headers
  (`style=simple, explode=false`) comma-join into one value. Previously
  every array param shipped `List.toString()` URL-encoded as
  `?tags=%5Ba%2C+b%5D` (#134). Non-default `style` / `explode` /
  `allowReserved` now warn instead of silently producing wrong output
  (#141).
- **Trailing `?` on URLs without query params** is dropped (`Uri.replace`
  always appends `?` even when the merged map is empty) (#140).
- **Schema defaults** are substituted in `fromJson` for nullable
  const-default fields. Previously `Foo.fromJson({}).isFavorited == null`
  even though the spec declared `default: false`. Also fixes a latent
  `WaitTimer(null)` crash in `RenderNumber.defaultValueString` (#128).
- **Bool newtypes** suppress `avoid_positional_boolean_parameters` via a
  per-file `// ignore_for_file:` directive — the type name is the
  disambiguation. Directive carries its own justification block to
  satisfy `document_ignores` (#124, #129).
- **`comment_references` in generated dartdoc** is suppressed via a
  per-file directive when a `///` line contains `[<token>]` not followed
  by `(` (legitimate `[Foo](url)` markdown links left alone). Decision
  happens at emit time, not as a post-walk readback (#130, #138).
- **Backtick code spans** stay on one line when wrapping doc comments —
  `wrapLines` now tracks backtick parity per line and refuses to break
  inside an open span. Closes `unintended_html_in_doc_comment` hits
  caused by long backticked descriptions like `` `heads/<branch name>` ``
  (#125).
- **Dotted schema names** (`.App.Features.Marketplace.Order.Foo` from
  .NET / NSwag-style specs) collapse to underscores in `toSnakeCase`,
  not pass through verbatim — fixes a hard-fail on real specs (#119).
- **Non-enum identifiers** always camelCase under
  `quirks.screamingCapsEnums`. The quirk's gate previously also covered
  property and parameter names, so snake_case spec-side identifiers
  like petstore's `api_key` survived into Dart variables and tripped
  `non_constant_identifier_names`. Enum SCREAMING_CAPS preservation is
  unaffected (#122).
- **Required-param validators cascade.** A required (non-nullable)
  parameter with multiple validators emits a `..` cascade chain
  (`id..validateMaximum(10)..validateMinimum(1)`) instead of duplicated
  receiver statements, silencing `cascade_invocations` (#197).
- **`model_helpers.dart`** is no longer a single source of "noisy"
  warnings: `unknown format` warnings demote to detail logs (#131); a
  cluster of spurious "unused" warnings on misplaced spec fields
  (vendor `x-*`, `maxProperties`, misplaced `required`, `webhooks`,
  `externalDocs`) is silenced (#176).

### Refactoring

- The `oneOf` dispatch picker lifts off of the render tree and into a
  dedicated `dispatch.dart` phase that operates on the resolved tree.
  Dispatch decisions are a sealed `DispatchDecision` family
  (`DiscriminatorDispatch`, `ShapeDispatch`, `HybridDispatch`,
  `PredicateDispatch`, `NoDispatch`); the if-chain tag-field is a
  sealed `Predicate` IR (`KeyExists`, `ArrayElementHasKey`,
  `PropertyArrayFirstIsType`, `PropertyArrayItemShape`, `Always`); the
  per-mode template-context shape is a sealed `_DispatchMode` so the
  type system enforces "exactly one mode active" (#157, #158, #160).

## 1.1.0

### Features

- Honor `security: []` on an operation as an explicit override of the
  global security requirement (public endpoint), rather than silently
  inheriting from the spec-level `security`. Previously the parser
  conflated "security key absent" with "security is the empty list",
  so any operation marked public under an otherwise-authenticated API
  still generated an `authRequest:` argument pointing at the global
  scheme. Covered by a new `gen_tests/security.json` fixture that
  exercises the Shorebird-shaped case: global bearer auth, one endpoint
  opting out via `security: []`, and one endpoint swapping to an
  `apiKey` scheme.
- Support `multipart/form-data` request bodies. Endpoints whose request
  body schema is an object of scalar + `format: binary` properties now
  generate a Dart method that takes the body object, unpacks it
  inline into text fields and `http.MultipartFile.fromBytes` file parts,
  and sends via a new `ApiClient.invokeApiMultipart` runtime method
  (which builds an `http.MultipartRequest` with its own Content-Type
  boundary). Objects with binary properties correctly throw
  `UnsupportedError` from `toJson`/`fromJson` instead of emitting
  dead-code-after-throw. Priority when a spec lists both JSON and
  multipart for the same body: JSON still wins. Out of scope for this
  pass and flagged for follow-up: `application/x-www-form-urlencoded`,
  arrays of files, nested objects as form fields, per-part
  `encoding.contentType`, and filenames other than the property name.
- Prune unused helpers from the generated `lib/model_helpers.dart`.
  Previously every generated package shipped all nine runtime helpers
  (`maybeParseDateTime`, `maybeParseDate`, `maybeParseUri`,
  `maybeParseUriTemplate`, `parseFromJson`, `listsEqual`, `mapsEqual`,
  `listHash`, `mapHash`) plus the `package:collection` / `package:uri`
  imports, even when no generated code referenced them. The file
  renderer now aggregates `SchemaUsage`/`ApiUsage` across every
  rendered file and emits only the helpers actually called — and
  skips writing `model_helpers.dart` entirely when the spec uses
  none. Consumers running coverage on generated code see fewer
  uncovered lines.
- Generated round-trip tests now assert the `fromJson` rejection
  contract where applicable. A new `RenderSchema.invalidJsonExample`
  hook returns a guaranteed-invalid JSON payload — implemented for
  enums (unknown string), objects with required properties (empty
  map, which fails the type cast inside `parseFromJson`), and
  `date`/`date-time` pods (unparseable string). When non-null, the
  `schema_round_trip_test` template emits an extra
  `throwsFormatException` test. No-op pods (string / email / uuid /
  boolean / uri / uri-template) and objects with no required fields
  get no negative test because any input is valid for them.
- Round-trip tests now also cover `toString` and every enum value.
  Previously each test only round-tripped `exampleValue`, which for
  enums is `values.first` — the generated `toString` override and
  every non-first variant were uncovered. Enum round-trip tests now
  iterate `values`, asserting `toString() == toJson()` and
  `fromJson(value.toJson()) == value` for each variant.
- Round-trip through `Type.maybeFromJson(instance.toJson())!` instead
  of `Type.fromJson`, and assert `parsed.hashCode == instance.hashCode`
  alongside `parsed == instance`. Exercises the nullable-input branch
  and catches drift between the generated `==` and `hashCode`
  overrides. A second test case pins `Type.maybeFromJson(null) == null`.
- Resolve external `$ref`s at generation time. A spec that refs
  schemas/responses/parameters/request-bodies/headers in another file
  (`$ref: 'shared.yaml#/components/schemas/Foo'`) now loads that file
  transitively, parses its `components:` section, and registers those
  objects under their absolute URIs so the resolver can find them.
  The resolver tracks which document it is currently reading from and
  resolves refs against that document — so refs inside an external
  file (local or cross-file) resolve against the right base rather
  than the root spec. External docs must be shaped as OpenAPI
  components libraries (`{components: {...}}`); anything else surfaces
  a clear `FormatException`. Previously, external refs hit a "Schema
  not found" at resolve time because only the root spec was walked
  into the registry.
- Support recursive `$ref` cycles. A schema like `Node` whose `left`
  and `right` properties both `$ref` back to `Node` previously sent
  the resolver into an infinite loop trying to inline an immutable
  tree. The resolver now tracks the stack of pointers currently being
  resolved; a `$ref` back to one already on the stack emits a
  `ResolvedRecursiveRef` cycle-break marker that renders as a
  class-name reference to the original newtype. Non-cyclic refs keep
  inlining as before — no behavior change for existing specs.
  Generated Dart: `final Node? left; final Node? right;` with
  recursive `toJson`/`fromJson` through the standard
  `Map<String, dynamic>` helpers.
- Detect name collisions in the spec and rename colliding schemas
  before emission, rather than writing one Dart file on top of another
  and silently losing types. When two schemas land with the same
  flattened class name, the resolver appends a disambiguating suffix
  drawn from the collision's JSON-pointer context so the generated
  files don't overwrite each other. Non-rendered types (schemas that
  never reach a separate file) are excluded from the collision set, so
  an inline placeholder with a short name doesn't force a rename on a
  real newtype.
- Expose the `FileRenderer` emit methods as `@protected` override
  hooks (`renderPubspec`, `renderAnalysisOptions`, `renderGitignore`,
  `renderApiException`, `renderAuth`, `renderApiClient`,
  `renderModelHelpers`, `renderApis`, `renderClient`, `renderPublicApi`,
  `renderCspellConfig`) so a subclass can skip individual output files.
  A generator-consumer package with a hand-maintained `pubspec.yaml`
  (or its own HTTP client, auth, etc.) can override just those hooks
  to no-op, while still regenerating models/messages/tests from the
  spec. Previously these were private `_render*` methods, so the only
  way to opt out was to overwrite the files after each regeneration.
- Honor the "named → newtype" invariant for pod schemas, and wire up
  more string formats. A top-level named schema whose body is a string
  or boolean pod (`type: string, format: date-time | uri | uri-template
  | email | uuid | date`, or `type: boolean`) now renders as an
  extension-type newtype wrapping its Dart type — previously, named
  `format: date-time` schemas silently inlined as raw `DateTime` at
  every reference, losing the wrapper. Inline fields continue to use
  the raw Dart type. `format: email` / `uuid` now map to a
  `String`-backed pod; `format: date` maps to a `DateTime` with
  `YYYY-MM-DD` JSON serialization via a new `maybeParseDate` helper;
  `format: time` is accepted without warning and falls through to
  `SchemaString` (no Dart type equivalent).
- Emit a round-trip test for each generated newtype by default at
  `test/<modelPath>_test.dart`. The test builds an in-memory instance
  via `RenderSchema.exampleValue` (implemented per subclass), then
  asserts `Type.fromJson(instance.toJson()) == instance`. Schemas that
  can't produce a safe example — recursive types, no-JSON types —
  opt out automatically (propagate `null` up). Consumers control the
  behavior with the new hooks:
  - `GeneratorConfig.generateTests` (default `true`): wholesale off
  - `FileRenderer.testPath(LayoutContext) → String?`: return `null` to
    skip a schema, or redirect (e.g. to `test/generated/` to avoid
    colliding with hand-written tests).
- Throw `FormatException` (not raw `TypeError`) from generated object
  `fromJson` factories on malformed input. A shared `parseFromJson`
  helper in `model_helpers.dart` wraps the constructor call in a
  try/catch that converts `TypeError` (which extends `Error`, so routes
  that do `on Exception catch` were dropping it and returning 500) into
  a `FormatException` that caller code can handle cleanly as
  "malformed request body". Generated factories are one line:
  `return parseFromJson('App', json, () => App(id: json['id'] as String, ...));`.
- Pick grammatically correct `a`/`an` in generated `fromJson`/`toJson`
  dartdoc (`/// Converts a \`Map<String, dynamic>\` to an [App].` instead
  of `… a [App].`). Class names starting with A/E/I/O get "an"; U is
  excluded since `User`/`Uniform`/`Unique` start with a consonant sound.
- Extend typed error bodies to `4XX`/`5XX` range responses. Previously
  only `default:` contributed to `ApiException<T>`. Now the generator
  collects error schemas from `default:`, `4XX:`, and `5XX:`,
  deduplicates by structural equality, and emits the typed throw when exactly one
  distinct error schema remains (the common case — most specs alias
  every error to a single `ErrorResponse`). When the error schemas
  disagree across those slots, the generator falls back to untyped
  `ApiException<Object?>` rather than lying about what callers will
  catch.
- Accept OpenAPI range status code keys (`1XX`/`2XX`/`3XX`/`4XX`/`5XX`)
  in response maps. Previously the parser rejected them with "Invalid
  response code". Range responses are stored separately from
  specific-code responses at each pipeline layer. `2XX` ranges feed the
  return-type determination — an operation declaring `2XX: { schema: X }`
  with no explicit 200 now generates `Future<X>` instead of
  `Future<void>`. Range schemas are walked for emission so the referenced
  types are generated like any other response.
- Generate a typed error body on generated API methods whose operation
  declares a `default:` response. `ApiException` is now generic
  (`ApiException<T>`): when the operation has a default response schema,
  the non-2xx branch throws `ApiException<ErrorType>(code, raw, body:
  ErrorType.fromJson(...))`; when it doesn't, the throw is unchanged
  (`ApiException(code, raw)`, type parameter inferred as `dynamic`).
  Callers can `catch (e) { if (e is ApiException<ErrorType>) { ... } }`
  or pattern-match on `e.body` for the parsed server error. The
  existing untyped catch-alls on `ApiException` (no type argument)
  still match.
- Parse OpenAPI `default:` responses instead of silently ignoring them.
  A default response is stored on `Responses.defaultResponse` at the
  parse layer, threads through the resolver and render tree as a
  separate field (the numeric-status-keyed responses are unchanged),
  and is walked by the render-tree walker so its referenced schema is
  always emitted — no more tree-shaking a type whose only reference is
  through `default:`.
- **Experimental:** expose a small customization surface for callers
  with their own layout conventions. `loadAndRenderSpec` now takes a
  single `GeneratorConfig` value (replacing 8 individual named
  arguments) that includes an optional `fileRendererBuilder` hook;
  [FileRenderer] accepts a single `FileRendererConfig` bundle so
  subclasses forward `super(config)` without tracking constructor-
  parameter drift, and exposes a `@protected`
  `modelPath(LayoutContext)` hook that returns the `lib/`-relative
  path for a schema's file — letting subclasses redirect both the
  directory and the filename. Ship a `runCli` entrypoint helper that
  parses the standard CLI flags and runs `loadAndRenderSpec` so a
  custom consumer entrypoint is one line. The default behavior is
  unchanged; the public surface is intentionally narrow
  (`runCli`, `GeneratorConfig`, `FileRenderer`, `FileRendererConfig`,
  `LayoutContext`, `RenderSchema`, `FileRendererBuilder`) and
  labelled experimental pending feedback from additional consumers.
- Wrap a schema's class-level description in a dartdoc
  `{@template <snake_name>}` / `{@endtemplate}` block and emit
  `/// {@macro <snake_name>}` on the generated constructor, so the
  same prose documents both the class and its constructor without
  duplication. Matches the handwritten Dart convention. Off when the
  schema has no title/description.
- Emit `/// Converts a Map<String, dynamic> to a [Type].` dartdoc on
  generated `fromJson` factories and `/// Converts a [Type] to a
  Map<String, dynamic>.` on `toJson` methods. Object and empty-object
  schemas only; newtype/enum templates keep their existing one-line
  bodies uncommented (their input/output types are `String`/`num`,
  not `Map<String, dynamic>`, so a generic doc comment would be
  misleading).
- **Breaking:** Schemas are now emitted to `lib/models/<name>.dart` or
  `lib/messages/<name>.dart` (split by name suffix: classes whose name
  ends in `Request` or `Response` go to `messages/`) instead of a flat
  `lib/model/` directory. Matches the conventional layout of
  hand-written Dart packages (models as domain primitives, messages as
  request/response DTOs). The old flat `lib/model/` layout is still
  produced by `Quirks.openapi()` via the new `flatModelDir` quirk, so
  generators targeting OpenAPI Generator compatibility see no change.
  The previous `lib/model/` directory is also wiped when regenerating,
  so stale files from the old layout don't linger after an upgrade.
- Emit only the imports a rendered model/api body actually needs: drop
  unconditional `dart:convert`, `dart:io`, `package:meta/meta.dart`, and
  `model_helpers.dart` from models; gate `meta` and `model_helpers` on
  body contents; filter the schema's own file from its imports. Cuts
  `dart fix` work roughly in half on spacetraders and github.
- Support path-item-level `parameters`. Parameters declared on a path
  item now apply to every operation on that path; operation-level
  parameters still override by (name, in). Previously path-item-level
  parameters were silently dropped.
- Emit per-field dartdoc from schema property `description`. Previously
  the class-level description was rendered but property-level
  descriptions were dropped.
- Support the `x-enum-descriptions` vendor extension. A parallel array
  of strings alongside `enum:` now renders as per-case dartdoc on the
  generated enum.
- **Breaking:** `Quirks().allListsDefaultToEmpty` now defaults to
  `false`. The "nullable lists default to `const []`" behavior was
  really an OpenAPI convention and is now only on via
  `Quirks.openapi()`. Callers using the plain default who relied on
  the old behavior should opt in explicitly:
  `Quirks(allListsDefaultToEmpty: true)`.
- Honour the JSON Schema 2020-12 / OpenAPI 3.1 `propertyNames`
  keyword on map-shaped schemas. When `propertyNames` resolves to a
  named string enum, the generated field becomes `Map<EnumKey, V>`
  with the enum's `fromJson`/`toJson` round-tripping each key at the
  boundary. Handwritten `Map<ReleasePlatform, ReleaseStatus>` can now
  be expressed spec-compliantly without a vendor extension.

### Bug fixes

- Re-export third-party types referenced in public field signatures
  from the `api.dart` barrel, narrowed with `show` to exactly the
  names used. Model files import `package:uri/uri.dart` directly for
  `UriTemplate`-typed fields, but Dart exports don't chain through
  imports — a consumer (or a generated round-trip test) that imports
  only the barrel couldn't reference `UriTemplate` without also
  importing `package:uri/uri.dart` itself. The barrel now walks the
  rendered schemas, collects every third-party `package:` entry from
  `additionalImports` that has an explicit `shown:` list, and emits
  `export 'package:<pkg>/<entry>.dart' show <T1, T2, ...>;` covering
  only the specific types used —
  `export 'package:uri/uri.dart' show UriTemplate;` today. Imports
  without a `shown:` list (e.g. `package:meta/meta.dart` for
  `@immutable`) stay internal to the model file. Motivating case:
  the GitHub spec's `Root` model (~40 uri-template fields) produced
  40+ `undefined_function: UriTemplate` errors per regeneration; now
  clean.
- Include the synthetic `entries:` field in `RenderObject.exampleValue`
  so round-trip tests for schemas with `additionalProperties` compile.
  When a schema has `additionalProperties`, the generated class carries
  a required `entries: Map<String, V>` field alongside the named
  properties — but the exampleValue generator iterated only
  `properties` and produced a constructor call missing the required
  `entries` argument, yielding `missing_required_argument` errors for
  every such schema. The value type on the emitted Map literal matches
  the `additionalProperties.typeName` — `dynamic` for open
  additionalProperties, `String` for `{type: string}`, etc. Hit by
  `integration_permissions` and the `copilot_*` family on the GitHub
  spec.
- Skip round-trip test generation for schemas whose type is (or
  transitively contains a required) `oneOf` / `anyOf`. The
  `schema_one_of.mustache` template emits a sealed class with no
  concrete subclasses and an `UnimplementedError`-throwing `fromJson`,
  so there's no Dart value of the sealed type that can be constructed
  at compile time. Previously `RenderOneOf.exampleValue` returned the
  first branch's own example (e.g. a raw `'example'` String for
  `oneOf: [string, integer]`), which didn't type-check against the
  enclosing sealed-class field and produced errors like `String can't
  be assigned to IssuesCreateRequestTitle` — ~85 of the 156 broken
  tests in the generated GitHub client. Returning `null` propagates
  through `RenderObject.exampleValue` so the round-trip test is
  skipped for any schema that transitively depends on a oneOf/anyOf.
  Real coverage here is blocked on discriminator-aware subclass
  emission (#99); today's coverage was fake.
- Render `type: null` properties as `dynamic` instead of crashing.
  OpenAPI 3.1 / JSON Schema 2020-12 allows a property schema to be
  `{"type": "null"}`, meaning "the only legal value is `null`"; the
  parser has always produced a `ResolvedNull` for this, but the render
  layer had no case for it and aborted with
  `UnimplementedError: Unknown schema: ResolvedNull at <pointer>`.
  Now `toRenderSchema` maps `ResolvedNull` to `RenderUnknown`, which
  emits `dynamic` (same treatment as `additionalProperties: true`).
  A dedicated `RenderNull` with Dart's strict `Null` type would be
  more precise but isn't useful in practice. Found while running the
  generator against a real-world spec that declares a reserved-for-
  future-use `"placeholder": {"type": "null"}` field.
- Skip no-JSON schemas (`RenderVoid`, `RenderBinary`) when deciding
  whether an operation has a typed error body. Previously, a spec where
  the `default:` or 4XX/5XX response declared no content (just a
  `description:`) would collect a `RenderVoid` into `distinctErrorSchemas`,
  land in the "typed error" branch with `errorType == 'void'` and
  `errorFromJson == ''`, and emit uncompilable Dart like
  `throw ApiException<void>(code, body.toString(), body: ,);` — which
  failed `dart format` and blocked the whole generation. The fix
  filters `RenderNoJson` out of the error-schema set so such operations
  fall through to `ApiException<Object?>(code, message)` like any other
  untyped error. Hit while running petstore, which declares only
  description-only error responses.
- Accept unsupported security scheme declarations (`oauth2`,
  `openIdConnect` / `openIDConnect`, `mutualTLS`) at parse time instead
  of crashing the whole generation. Previously, any spec that even
  *declared* one of these schemes in `components.securitySchemes` died
  at `parser.dart:1096` with `UnimplementedError`, even when no
  operation required the scheme. Now those declarations parse to an
  `UnsupportedSecurityScheme` sentinel that renders as `NoAuth()` in
  generated operations, plus a `[WARN]` at generation time telling the
  consumer to override `ApiClient.resolveAuth` or set `defaultHeaders`
  if they actually need the auth. Unblocks the standard OpenAPI
  examples (petstore declares `oauth2.implicit`; train-travel declares
  `oauth2.authorizationCode`) and any other real spec that advertises
  oauth2/OIDC/mTLS without us having to implement them. The existing
  `apiKey` and `http` flows are untouched.
- Allow pod schemas (`format: uuid`, `date`, `date-time`, `email`, `uri`,
  `uri-template`, `boolean`) as path parameters. Previously
  `_canBePathParameter` only accepted `ResolvedString`, `ResolvedInteger`,
  `ResolvedEnum`, and recursive `ResolvedOneOf`, so a common pattern like
  `/resources/{id}` with `id` declared as `type: string, format: uuid`
  crashed the resolver with "Path parameters must be strings or
  integers". All pod types serialize to a single string via their
  `toJson` — which is the expression interpolated into the URL path —
  so they're legal path parameters. Found while running the generator
  against a third-party OpenAPI spec that uses UUID path parameters
  throughout.
- Normalize whitespace in `toSnakeCase` so tag names with spaces (e.g.
  `"Payment Methods"`, `"Seller Account"`) no longer survive into
  generated class names as `class Payment MethodsApi` — a literal
  space, uncompilable Dart, `dart format` fails, whole generation
  aborts. Any whitespace run now collapses to `_` before the existing
  camel/kebab conversions, followed by a final `_+ → _` pass to clean
  up the doubled underscores the intermediate form produces.
- Fix `application/octet-stream` and `text/plain` request bodies: the
  generated `ApiClient.invokeApi` was JSON-encoding every non-null body
  (including `Uint8List` and raw `String`) and always sending
  `Content-Type: application/json`. Binary and text bodies now pass
  through unchanged with the correct `Content-Type` header, driven by a
  new `BodyContentType` enum threaded through the generated call sites.
- Export `Api` and `RenderSpec` from `package:space_gen/space_gen.dart`
  so subclasses of `FileRenderer` can actually spell the parameter
  types of the new override hooks (`renderApis`, `renderClient`,
  `renderPublicApi`, `renderApiClient`). Shipped with the hooks
  initially but briefly forgotten, breaking every attempt to override.
- Escape reserved words in generated API method parameter names. A
  spec with a parameter literally named `with`/`try`/`case`/... now
  emits `required String with_` (matching `dartParameterName`) instead
  of the uncompilable `required String with`. `RenderParameter`'s
  template context was using raw `lowercaseCamelFromSnake(name)` while
  every other call site went through `variableSafeName`, producing a
  name mismatch and invalid Dart.
- Fix generated `hashCode` to be consistent with `==` on list/map
  fields. Two instances with the same list/map contents now hash to
  the same value — matching the `listsEqual`/`mapsEqual`-based `==`
  override. Before, `==` returned true but `hashCode` differed
  (identity hash on the list/map), violating the Dart contract. New
  `listHash`/`mapHash` helpers in `model_helpers.dart`, wired through
  a `RenderSchema.hashCodeExpression` hook.
- Fix `Future<void>` endpoints so a successful empty body (e.g. 204
  No Content) returns normally. Generated methods previously fell
  through to `throw ApiException.unhandled(...)` whenever the body
  was empty, which meant every successful DELETE/PATCH on a 204 route
  threw.
- Trim trailing whitespace off doc-comment text so YAML block-scalar
  descriptions (`description: |`) no longer render a dangling `///`
  line before the class or field they document.
- Complete the Dart reserved-word list used to escape identifiers.
  Previously only a handful of keywords (`new`, `void`, `null`, ...)
  were escaped; enum values like `TRY` or `CLASS` generated
  uncompilable `try._('TRY')` / `class._('CLASS')`. Now all Dart
  reserved words, built-in identifiers, and contextual keywords are
  escaped with a trailing underscore.
- Fix `RenderMap.jsonStorageType` to honour `isNullable`. Previously a
  nullable map field emitted
  `(json[key] as Map<String, dynamic>)?.map(...)` — the cast crashed
  when the key was missing/null (`type 'Null' is not a subtype of type
  'Map<String, dynamic>'`). Now emits
  `(json[key] as Map<String, dynamic>?)?.map(...)` so the null-aware
  `?.map` chain actually has a nullable receiver.
- Fix `RenderArray.defaultValueString` to return `null` when the
  schema has no default (previously crashed casting `null as List`
  once `allListsDefaultToEmpty` was off).
- Fix nullable primitive query parameters to be null-safe. Generated
  code previously emitted `?foo.toString()`, which always produced a
  map entry (with the literal string `"null"` as its value) because
  `.toString()` on a null primitive returns the string `"null"`. Now
  emits `?foo?.toString()`, so the null-aware map-entry operator
  correctly suppresses the entry when the parameter is null.

## 1.0.1

- Fix finding of template files when run via `dart pub run space_gen`.

## 1.0.0

- Initial version.
