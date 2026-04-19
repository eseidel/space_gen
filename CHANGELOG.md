## 1.0.3

- Fix `Future<void>` endpoints so a successful empty body (e.g. 204
  No Content) returns normally. Generated methods previously fell
  through to `throw ApiException.unhandled(...)` whenever the body
  was empty, which meant every successful DELETE/PATCH on a 204 route
  threw.

## 1.0.2

- Emit only the imports a rendered model/api body actually needs: drop
  unconditional `dart:convert`, `dart:io`, `package:meta/meta.dart`, and
  `model_helpers.dart` from models; gate `meta` and `model_helpers` on
  body contents; filter the schema's own file from its imports. Cuts
  `dart fix` work roughly in half on spacetraders and github.

## 1.0.1

- Fix finding of template files when run via `dart pub run space_gen`.

## 1.0.0

- Initial version.
