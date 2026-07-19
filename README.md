[![codecov](https://codecov.io/gh/eseidel/space_gen/graph/badge.svg?token=nOnPSYpPXi)](https://codecov.io/gh/eseidel/space_gen)
[![Powered by Shorebird](https://img.shields.io/endpoint?url=https://tinyurl.com/shorebirddev)](https://shorebird.dev)

# space_gen

_Generates Dart code so beautiful, it must be from outer space!_

A simple, hackable OpenAPI 3.0 and 3.1 generator.

Implements most of the OpenAPI spec.  Patches welcome.

## Installing 🧑‍💻

`space_gen` is typically installed via pub, so you have two options for install:

### Option 1: Global install
Short command line (just `space_gen`) for use across all projects:

```sh
dart pub global activate space_gen
```

Or install a [specific version](https://pub.dev/packages/space_gen/versions) using:

```sh
dart pub global activate space_gen <version>
```

If you haven't already, you might need to [set up your path][path_setup_link].

### Option 2: Per-project install
Useful if you need per-project versions or want everything self-contained.

```sh
dart pub add --dev space_gen
```

```sh
dart run space_gen <args>
```

## Project Values

- Generates highest quality, modern Dart code.
- Zero analyzer, formatter or linter errors. Aims to be as good as handwritten.
- Gives readable errors on failure.
- Aspires to handle all of OpenAPI 3.x.
- Generates testable code.

## Advantages over Open API Generator 7.0.0

- Modern null-safe Dart (currently 3.8+ only)
- Generates properly recursive toJson/fromJson which round-trip fully.
- Able to generate immutable models.
- Uses real enum classes.
- Handles oneOf, allOf, anyOf.
- fromJson is non-nullable.
- Generates maybeFromJson with explicit nullability.
- Generates independent classes, which can be imported independently.
- Correctly follows required vs. nullable semantics.

## Why not just contribute to OpenAPI?

This started as a hobby project in August 2023, there were two separate (soon to
be combined?) OpenAPI generators for Dart. One for package:http and one for
package:dio. I only ever used the http one and it had lots of bugs. I looked at
fixing them in OpenAPI, but failed to figure out how to hack on the OpenAPI
generator (Java) or successfully interact with the community (several separate
slacks) so ended up starting my own. Still in 2025 there doesn't seem to be
a consensus towards a better Dart generator, so releasing this one.

## Design

- Loader - Fetches spec urls and imports.
- Parser - Turns Json/Yaml parsed tree into Spec, some validation.
- Resolver - Resolves all references into Resolved\* tree, more validation.
- Renderer - Translates Resolved tree into Render tree. Render tree is passed
  off to FileRenderer which uses SchemaRenderer to render api (operation) and
  model (schema) files and imports.

### We own the directories we generate into, and nothing else

A schema you rename or delete would otherwise leave its old file
behind, and that file still refers to the class under its old name — so
the regenerated package stops analyzing. So after generating, space_gen
removes anything it did not write from the directories it wrote into.

Those directories are worked out from what the run actually produced,
not from a fixed list, because layout is yours to change through
`FileRenderer.modelPath` and `FileRenderer.testPath`. A fixed list
naming `lib/models/` cleans nothing for a consumer who moved models to
`lib/src/models/` — which is exactly the consumer most likely to need
it.

Two things are deliberately never touched:

- **The package root, `lib/`, and `test/` themselves.** A package's own
  files live there by Dart convention, so ours sit beside yours. We
  write no README, LICENSE, CHANGELOG or `.github/`, and a generated
  client is often its own repository holding all of them.
- **Anything under `--no-clear`** (`GeneratorConfig.clearDirectory:
  false`), which disables removal entirely. Use it if you want to
  manage stale output yourself.

The rule errs toward leaving too much rather than deleting too much. A
stale file that fails to analyze is noisy and takes one `rm` to fix;
a deleted file you wrote is gone.

### Lint suppression lives in the generated `.dart` files

space_gen supports consumers who don't use the `analysis_options.yaml` it
emits. A consumer can subclass `FileRenderer` and override the scaffold hooks
(`renderAnalysisOptions`, the barrel, the HTTP client) to no-op, then
hand-maintain those files themselves — `shorebird_code_push_protocol` does
exactly this, down to its own workspace `analysis_options.yaml` formatter
settings, which space_gen reads and respects at write time.

Because of that, lint noise from spec-derived prose (angle brackets in
descriptions, unresolvable `[bracket]` references, long lines, etc.) is
suppressed **in-file**, via emit-time `// ignore_for_file:` directives added by
the `maybeAdd*Ignore` helpers in `render/formatting.dart`. A per-file directive
travels with the `.dart` file and works regardless of whose `analysis_options`
wins; a blanket disable in the emitted `analysis_options.yaml` only reaches
consumers who keep it, so it silently fails for the hand-maintained case.

New per-spec lint suppression should follow this pattern rather than adding a
blanket disable. (The blanket disables still present in the
`analysis_options.mustache` template predate this decision.)

### Great Dart first; OpenAPI-Generator-shaped when convenient

The overriding goal is Dart output that reads as if it were hand-written (see
[Project Values](#project-values)). That always wins. Where — and only where —
it leaves a genuine choice between shapes that are equally good Dart, space_gen
prefers the one that resembles the [OpenAPI
Generator](https://openapi-generator.tech/)'s Dart client. Resembling the
OpenAPI Generator is a fallback we reach for when it's free; it is never a
reason to generate worse Dart.

The reason for the fallback is migration: when this project started, the
OpenAPI Generator was the most popular Dart client generator, so the main way
people would adopt space_gen was by porting an existing generated client, which
is smoothest when the generated surface (field names, accessors, types) lines
up. This is why, for example, an object with `additionalProperties` exposes its
overflow through an `entries` map rather than a field name we might pick in
isolation.

Even this fallback is a default we may revisit — the opt-in [quirks](#openapi-quirks)
already diverge on purpose, and as LLMs take over the mechanical parts of
migration, byte-level familiarity with one reference generator matters less
than it used to. But being OpenAPI-Generator-shaped is always subordinate to
being good Dart.

## Tested specs

space_gen is iterated against a rotation of real-world OpenAPI specs.
For each, the regenerated client is expected to `dart analyze` clean
and its synthesized round-trip tests are expected to pass.

- **[GitHub REST API](https://github.com/github/rest-api-description)**
  (~1000 operations, OpenAPI 3.0) — Complete.
- **[Discord API](https://github.com/discord/discord-api-spec)**
  (~511 schemas, ~141 paths, OpenAPI 3.1) — In progress.
- **[SpaceTraders](https://spacetraders.io)** — Complete.
- **[Train Travel API](https://github.com/bump-sh-examples/train-travel-api)**
  (YAML, OpenAPI 3.1) — Complete.
- **[Backstage catalog API](https://github.com/backstage/backstage/blob/master/plugins/catalog-backend/src/schema/openapi.yaml)**
  (YAML, OpenAPI 3.1) — Complete. Exercises `JsonObject` / open-object `allOf`
  members and `properties: {}` + `additionalProperties` maps.
- **[Petstore](https://github.com/swagger-api/swagger-petstore)** (the
  OpenAPI canonical example) — Complete.

If you try space_gen against a public spec and the output isn't
clean, please [file an issue](https://github.com/eseidel/space_gen/issues).

## OpenApi Quirks

space_gen implements a few OpenAPI quirks to optionally make the generated
output maximally openapi_generator compatible in case you're transitioning
from openapi_generator to space_gen.

#### Lists default to []

OpenAPI makes all List values default to [], and stores all lists as
non-nullable, even if they're nullable (not required) in the spec. This
breaks round-tripping of values, since if your 'list' property is null
(or missing) openapi_generator will parse it as [] and send back []. The
openapi_generator can never send null for a list value. space_gen has this
quirk on by default for now, but it can be disabled.

#### SCREAMING_CAPS enums

OpenAPI uses SCREAMING_CAPS enums, this can be enabled in space_gen for easier
transition from openapi_generator to space_gen. By default space_gen will
use lowerCamelCase enums matching Dart style.

#### Mutable Models

OpenAPI generates mutable model types and your existing code may depend on
this behavior. space_gen can generate either mutable or immutable model types
and by default makes models immutable.

[path_setup_link]: https://dart.dev/tools/pub/cmd/pub-global#running-a-script-from-your-path