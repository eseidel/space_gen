# space_gen

Dart OpenAPI client generator. Generated code must have zero analyzer, lint or
format issues. Pipeline and recursion design: `ARCHITECTURE.md`.

## Golden fixtures

- `dart run tool/gen_tests.dart` regenerates `gen_tests/`; commit the regen
  with any generator change that alters output. CI fails on any diff.
- `gen_tests/` uses `Quirks.openapi()`; `gen_tests/third_party/` does not.
- `gen_tests/*` are standalone packages, excluded from root `dart analyze`.

## Rules

- Don't edit `CHANGELOG.md`; the release skill builds it from each PR body's
  `## Summary`.
- `Schema*`, `Resolved*` and `Render*` classes mark every constructor
  parameter `required`, including nullable and list fields.
- `createsNewType` is true for `RenderRecursiveRef`;
  `FileRenderer.rendersToSeparateFile` is false for it.
- New words go in `cspell.config.yaml`; CI blocks on unknown words.
