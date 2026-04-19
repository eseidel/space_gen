/// Quirks are a set of flags that can be used to customize the generated code.
class Quirks {
  const Quirks({
    this.dynamicJson = false,
    this.mutableModels = false,
    this.allListsDefaultToEmpty = false,
    this.nonNullableDefaultValues = false,
    this.screamingCapsEnums = false,
    this.flatModelDir = false,
  });

  const Quirks.openapi()
    : this(
        dynamicJson: true,
        mutableModels: true,
        nonNullableDefaultValues: true,
        allListsDefaultToEmpty: true,
        screamingCapsEnums: true,
        flatModelDir: true,
      );

  /// Use "dynamic" instead of "Map\<String, dynamic\>" for passing to fromJson
  /// to match OpenAPI's behavior.
  final bool dynamicJson;

  /// Use mutable models instead of immutable ones to match OpenAPI's behavior.
  final bool mutableModels;

  /// OpenAPI seems to have the behavior whereby all Lists default to empty
  /// lists.
  final bool allListsDefaultToEmpty;

  /// OpenAPI seems to have the behavior whereby if a property has a default
  /// value it can never be nullable.  Since OpenAPI also makes all Lists
  /// default to empty lists, this means that all Lists are non-nullable.
  final bool nonNullableDefaultValues;

  /// OpenAPI uses SCREAMING_CAPS for enum values, but that's not Dart style.
  final bool screamingCapsEnums;

  /// Emit all schemas into a single flat `lib/model/` directory, matching
  /// the layout OpenAPI Generator produces. Off by default: schemas are
  /// split into `lib/models/` (domain models) and `lib/messages/`
  /// (classes whose name ends in `Request`/`Response`), which better
  /// matches hand-written Dart packaging.
  final bool flatModelDir;
}
