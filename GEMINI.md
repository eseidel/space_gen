# Gemini Project Context

This file provides context for the Gemini AI assistant to help it understand and work with this project more effectively.

## Project Overview

`space_gen` is a code generation tool written in Dart. It takes an OpenAPI 3.0 or 3.1 specification and generates a Dart client library. The goal is to produce high-quality, modern, and idiomatic Dart code that is as good as handwritten code.

## Key Technologies

- **Language:** Dart
- **Templating:** Mustache
- **Dependency Management:** Pub
- **Linting:** `very_good_analysis`

## Development Workflow

### Running the Generator

To run the code generator, use the following command:

```bash
dart run space_gen -i <path_or_url_to_spec> -o <output_directory>
```

### Running Tests

To run the project's test suite, use:

```bash
dart test
```

### Formatting and Analysis

To format the code and check for static analysis issues, use the standard Dart commands:

```bash
# Format code
dart format .

# Run static analysis
dart analyze
```

## Coding Conventions

- **Commits:** Prefer adding new, atomic commits rather than amending existing ones when updating a pull request.
