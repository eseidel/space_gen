## 1.0.2

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
