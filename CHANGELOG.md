## 1.0.2

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
- Fix `Future<void>` endpoints so a successful empty body (e.g. 204
  No Content) returns normally. Generated methods previously fell
  through to `throw ApiException.unhandled(...)` whenever the body
  was empty, which meant every successful DELETE/PATCH on a 204 route
  threw.
- Support path-item-level `parameters`. Parameters declared on a path
  item now apply to every operation on that path; operation-level
  parameters still override by (name, in). Previously path-item-level
  parameters were silently dropped.
- Emit per-field dartdoc from schema property `description`. Previously
  the class-level description was rendered but property-level
  descriptions were dropped.
- Trim trailing whitespace off doc-comment text so YAML block-scalar
  descriptions (`description: |`) no longer render a dangling `///`
  line before the class or field they document.
- Complete the Dart reserved-word list used to escape identifiers.
  Previously only a handful of keywords (`new`, `void`, `null`, ...)
  were escaped; enum values like `TRY` or `CLASS` generated
  uncompilable `try._('TRY')` / `class._('CLASS')`. Now all Dart
  reserved words, built-in identifiers, and contextual keywords are
  escaped with a trailing underscore.
- Support the `x-enum-descriptions` vendor extension. A parallel array
  of strings alongside `enum:` now renders as per-case dartdoc on the
  generated enum.
- Fix `RenderMap.jsonStorageType` to honour `isNullable`. Previously a
  nullable map field emitted
  `(json[key] as Map<String, dynamic>)?.map(...)` — the cast crashed
  when the key was missing/null (`type 'Null' is not a subtype of type
  'Map<String, dynamic>'`). Now emits
  `(json[key] as Map<String, dynamic>?)?.map(...)` so the null-aware
  `?.map` chain actually has a nullable receiver.
- **Breaking:** `Quirks().allListsDefaultToEmpty` now defaults to
  `false`. The "nullable lists default to `const []`" behavior was
  really an OpenAPI convention and is now only on via
  `Quirks.openapi()`. Callers using the plain default who relied on
  the old behavior should opt in explicitly:
  `Quirks(allListsDefaultToEmpty: true)`.
- Fix `RenderArray.defaultValueString` to return `null` when the
  schema has no default (previously crashed casting `null as List`
  once `allListsDefaultToEmpty` was off).
- Honour the JSON Schema 2020-12 / OpenAPI 3.1 `propertyNames`
  keyword on map-shaped schemas. When `propertyNames` resolves to a
  named string enum, the generated field becomes `Map<EnumKey, V>`
  with the enum's `fromJson`/`toJson` round-tripping each key at the
  boundary. Handwritten `Map<ReleasePlatform, ReleaseStatus>` can now
  be expressed spec-compliantly without a vendor extension.
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
