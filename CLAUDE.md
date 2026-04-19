# Project Context for Claude

## What `space_gen` is

A Dart OpenAPI 3.0/3.1 client generator. The goal is highest-quality idiomatic
Dart output — zero analyzer/lint/format issues on generated code, reads as
close to handwritten as possible. Pipeline:

1. **Loader** (`lib/src/loader.dart`) — fetches specs/imports.
2. **Parser** (`lib/src/parser.dart`, `lib/src/parse/`) — YAML/JSON → `Spec`
   (+ validation).
3. **Resolver** (`lib/src/resolver.dart`) — walks `Spec`, turns every `$ref`
   into a fully resolved `ResolvedSchema` tree. Adds more validation.
4. **Renderer** (`lib/src/render/`) —
   - `render_tree.dart` translates `ResolvedSchema` → `RenderSchema` via
     `SpecResolver.toRenderSchema`.
   - `file_renderer.dart` walks the render tree, emits Dart files via Mustache
     templates (or `.dart` file templates).
   - `schema_renderer.dart` is the per-schema template-context builder.
   - `tree_visitor.dart` has `RenderTreeWalker` — used to collect schemas
     under an API for import generation.

Two related predicates split on purpose:

- `createsNewType` — true when a schema participates in a named-type identity
  (has its own class name used at reference sites). True for objects, enums,
  oneOf/allOf/anyOf, **and** `RenderRecursiveRef` (which points at one).
- `FileRenderer.rendersToSeparateFile` — true only when a schema actually
  renders its own Dart file. True for newtypes, **false** for
  `RenderRecursiveRef` (the target renders the file, the ref just imports it).

## Commands

```sh
dart test                 # full test suite
dart test test/foo.dart   # single file
dart analyze
dart format .
dart run space_gen -i <spec> -o <out>   # run the generator
```

Golden-output tests live under `gen_tests/` and are driven by
`tool/gen_tests.dart`. `gen_tests/*` are standalone packages with their own
pubspec — excluded from the root `dart analyze` via `analysis_options.yaml`.

## Recursion support

Recursive `$ref` cycles (e.g. `Node` with `left`/`right` both
`$ref: '#/components/schemas/Node'`) are supported via a cycle-break marker
approach. See the class-level doc comment on `RenderRecursiveRef` in
`lib/src/render/render_tree.dart` for the full design. Short version:

- `resolveSchemaRef` tracks a `resolvingStack` of pointers currently being
  resolved. A `$ref` back into the stack returns `ResolvedRecursiveRef`
  (cycle-break). Non-cyclic refs still inline as before — preserving behavior
  for non-recursive specs.
- `ResolvedRecursiveRef` → `RenderRecursiveRef` in `toRenderSchema`.
- `RenderRecursiveRef` is a walker leaf. It emits the target's class name and
  standard `Map<String, dynamic>` `toJson`/`fromJson` calls, hard-coded
  because today's cycle targets are always object-shaped newtypes (Object /
  OneOf / AllOf / AnyOf / EmptyObject). If top-level Array/Map newtypes ever
  ship (README TODO), this class will need to delegate those methods to the
  target — see its doc comment.

## Conventions

- 80-col wrap (enforced for code, not strict for doc comments).
- `very_good_analysis` lint.
- Prefer new atomic commits over `git amend`.
- `CHANGELOG.md` entries per feature. Don't bump the heading; stack
  new bullets under the top-most `## x.y.z` until the pubspec version
  actually bumps.
- Keep custom words in `cspell.config.yaml` — CI blocks on unknown words.
  `newtype` / `newtypes` / `renderable` are common false positives.
- **`required` on internal pipeline types**: `Schema*` (parse),
  `Resolved*` (resolve), and `Render*` (render) classes mark **every**
  constructor parameter `required`, including fields that default to
  `null` or an empty list. These aren't user-facing APIs like Flutter
  widgets — they're plumbing. A field that should thread all three
  layers can silently be dropped if intermediate constructors have
  defaults; `required` turns the "I forgot to pass it" case into a
  compile error at every call site instead of a quietly-dropped value
  in the generator. Any exception here should be justified in code
  comments, not with a convenient default.

## Gotchas

- There may be an in-progress `git rebase` left over from an old session
  (`adding_fixes` onto some older commit). If `git status` says "currently
  editing a commit while rebasing" and you're not doing that work, don't
  touch it — ask before `git rebase --abort`.
- Local scratch files at the repo root (`.vscode/`, `auth_design.md`,
  `*.txt` spec fixtures) are untracked and not part of any PR.
