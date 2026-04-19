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
