/// Quirks are a set of flags that can be used to customize the generated code.
class Quirks {
  const Quirks({
    this.dynamicJson = false,
    this.mutableModels = false,
    // Avoiding ever having List? seems reasonable so we default to true.
    this.allListsDefaultToEmpty = true,
    this.nonNullableDefaultValues = false,
    this.screamingCapsEnums = false,
  });

  const Quirks.openapi()
    : this(
        dynamicJson: true,
        mutableModels: true,
        nonNullableDefaultValues: true,
        allListsDefaultToEmpty: true,
        screamingCapsEnums: true,
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

  // Potential future quirks:

  /// OpenAPI flattens everything into the top level `lib` folder.
  // final bool doNotUseSrcPaths;
}
