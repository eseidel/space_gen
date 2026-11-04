# space_gen

Pipeline: `ARCHITECTURE.md`. Recursion design: doc comment on
`RenderRecursiveRef` in `lib/src/render/render_tree.dart`.

## Golden fixtures

- `dart run tool/gen_tests.dart` regenerates `gen_tests/`; commit the regen
  with any generator change that alters output. CI fails on any diff.
- CI also runs `dart run tool/gen_tests.dart --verify`, which analyzes and
  tests the generated packages.
- `gen_tests/` uses `Quirks.openapi()`; `gen_tests/third_party/` does not.
- `gen_tests/*` are standalone packages, excluded from root `dart analyze`.

## Rules

- Don't edit `CHANGELOG.md`; the release skill builds it from each PR body's
  `## Summary`.
- New constructor parameters on `Schema*`, `Resolved*` and `Render*` classes
  are `required`, including nullable and list fields, so no layer drops one.
- Don't conflate `createsNewType` with `FileRenderer.rendersToSeparateFile`:
  `RenderRecursiveRef` is true for the first, false for the second.
- New words go in `cspell.config.yaml`; CI blocks on unknown words.
