[![codecov](https://codecov.io/gh/eseidel/space_gen/graph/badge.svg?token=nOnPSYpPXi)](https://codecov.io/gh/eseidel/space_gen)

# space_gen

_Generates Dart code so beautiful, it must be from outer space!_

A simple, hackable OpenAPI 3.0 and 3.1 generator.

Implements most of the OpenAPI spec.  Patches welcome.

## Usage

dart run space_gen -i spec_path_or_url -o output_package_path

## Values

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

## Todo

- Wire up Authentication and sending of bearer header.
- Generate tests. https://github.com/eseidel/space_gen/issues/1
- Fix toString hack for queryParameters.
- Support Parameter.explode.
- Finish oneOf support.
- Remove the 'prop' hack for GitHub spec.
- Split render tree into some sort of "types" library and types -> code gen.
- Support 'default' for objects.
- Make RenderPod and RenderEnum typed.
- Wrap description doc comments to 80c.
- Recursively validations for properties of named schemas (currently only
  do top-level const-ready validations).
- Add (non-const) validation during construction of new-type objects, will
  require making generator aware that some objects can't be const constructed
  as well as adding a const-constructor for those objects for default values.
- Handle 'example' and 'examples' fields.
- explicitly handle format=int64
- Handle format=double and format=float
- Handle deprecated=true in more places (e.g. enums)
- Map & Array newtype via explicitly named schema?
- readOnly and writeOnly
- Do not delete more directory contents than necessary.

### OpenApi Quirks

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
