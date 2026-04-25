# space_gen example

A tiny OpenAPI 3.1 spec for a pet store, plus the command to generate a
Dart client package from it.

## The spec

[`petstore.yaml`](petstore.yaml) defines two operations — `listPets` and
`getPet` — and a `Pet` model with a `PetStatus` enum. It's intentionally
small so the generated output is easy to skim.

## Generating a client

From this directory:

```sh
dart pub global activate space_gen
space_gen -i petstore.yaml -o petstore_api
```

Or, without a global install:

```sh
dart run space_gen -i petstore.yaml -o petstore_api
```

`space_gen` writes a full Dart package into `petstore_api/`, including:

- `lib/api/default_api.dart` — a `DefaultApi` class with `listPets()` and
  `getPet()` methods.
- `lib/models/pet.dart` and `lib/models/pet_status.dart` — immutable
  model classes with `fromJson` / `toJson` and a real Dart enum.
- `lib/api_client.dart`, `lib/api_exception.dart` — the shared runtime.
- `lib/api.dart` — a barrel that re-exports the APIs, models, and
  runtime for consumers.
- `test/models/` — round-trip tests for each model.
- `pubspec.yaml`, `analysis_options.yaml` — ready to `dart pub get`.

## Using the generated client

```dart
import 'package:petstore_api/api.dart';

Future<void> main() async {
  final api = DefaultApi(ApiClient());
  final pets = await api.listPets();
  for (final pet in pets) {
    print('${pet.id}: ${pet.name} (${pet.status.name})');
  }
}
```

See the top-level [README](../README.md) for the full list of supported
OpenAPI features and configuration flags.
