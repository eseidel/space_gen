[![codecov](https://codecov.io/gh/eseidel/space_gen/graph/badge.svg?token=nOnPSYpPXi)](https://codecov.io/gh/eseidel/space_gen)

# space_gen

_Generates Dart code so beautiful, it must be from outer space!_

A simple, hackable OpenAPI 3.x generator.

Implements most of OpenAPI. Patches welcome.

## Usage

dart run space_gen -i spec_path_or_url -o output_package_path

## Values

- Generates highest quality, modern Dart code.
- Zero analyzer, formatter or linter errors. Nearly as good as by-hand.
- Gives readable errors on failure.
- Aspires to handle all of OpenAPI 3.x.
- Generates testable code.

## Advantages over Open API Generator 7.0.0

- Dart 3.0+ only (sound null safety)
- Model code round trips through JSON correctly (TBD)
- Generates properly recursive toJson/fromJson which round-trip fully!
- Able to generate immutable models.
- Uses real enum classes!
- fromJson is non-nullable.
- Generates maybeFromJson with explicit nullability.
- Generates independent classes, which can be imported independently.
- Better follows required vs. nullable semantics.

## Why not just contribute to OpenAPI?

When this effort started in August 2023, there were two separate (soon to be
combined?) OpenAPI generators for Dart. One for package:http and one for
package:dio. I only ever used the http one and it had lots of bugs. I looked at
fixing them in OpenAPI, but failed to figure out how to hack on the OpenAPI
generator (Java) or successfully interact with the community (several separate
slacks).

## Design

- Loader - Fetches spec urls and imports.
- Parser - Turns Json/Yaml parsed tree into Spec, some validation.
- Resolver - Resolves all references into Resolved\* tree, more validation.
- Renderer - Translates Resolved tree into Render tree. Render tree is passed
  off to FileRenderer which uses SchemaRenderer to render api (operation) and
  model (schema) files and imports.

## Todo

- Generate tests. https://github.com/eseidel/space_gen/issues/1
- Handle min/max in newtype types.
- Wire up Authentication and sending of bearer header.
- Fix toString hack for queryParameters.
- Support Parameter.explode.
- Finish oneOf support.
- Remove the 'prop' hack for GitHub spec.
- Split render tree into some sort of "types" library and types -> code gen.
- Support 'default' for objects.
- Make RenderPod and RenderEnum typed.
- Wrap description doc comments to 80c.
- Support 'pattern' string validation.
- Consider generating parameter validation different from stand-alone model validation.
e.g. doFoo(int bar) (with 'bar' validating inside the doFoo call) vs.
creating a Bar type and validating within the Bar constructor.
This would remove a ton of separate types.

Is the body sometimes passed in as an object, and sometimes created by
the endpoint? Or is it always created by the endpoint?

### OpenApi Quirks

space_gen implements a few OpenAPI quirks to optionally make the generated
output maximally openapi_generator compatible in case you're transitioning
from openapi_generator to space_gen.

#### Lists default to []

OpenAPI makes all List values default to [], and stores all lists as
non-nullable, even if they're nullable (not required) in the spec. This
breaks round-tripping of values, since if your 'list' property is null
(or missing) openapi_generator will parse it as [] and send back []. The
openapi_generator can never send null for a list value.
