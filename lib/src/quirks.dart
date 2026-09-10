/// Quirks are a set of flags that can be used to customize the generated code.
class Quirks {
  const Quirks({
    this.dynamicJson = false,
    this.mutableModels = false,
    this.allListsDefaultToEmpty = false,
    this.screamingCapsEnums = false,
    this.flatModelDir = false,
    this.preserveUnknownEnums = false,
  });

  const Quirks.openapi()
    : this(
        dynamicJson: true,
        mutableModels: true,
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

  /// OpenAPI uses SCREAMING_CAPS for enum values, but that's not Dart style.
  final bool screamingCapsEnums;

  /// Emit all schemas into a single flat `lib/model/` directory, matching
  /// the layout OpenAPI Generator produces. Off by default: schemas are
  /// split into `lib/models/` (domain models) and `lib/messages/`
  /// (classes whose name ends in `Request`/`Response`), which better
  /// matches hand-written Dart packaging.
  final bool flatModelDir;

  /// Parse unknown enum JSON into a `TypeUnknown(raw)` instead of throwing,
  /// and emit that same `raw` from `toJson`. Off by default. Independent of
  /// [Quirks.openapi] — adding an enum member is additive for clients that
  /// stay in the field, and cycling an entity through the client must not
  /// overwrite a new member the old build does not know.
  final bool preserveUnknownEnums;

  /// Returns a copy with the given fields replaced.
  Quirks copyWith({
    bool? dynamicJson,
    bool? mutableModels,
    bool? allListsDefaultToEmpty,
    bool? screamingCapsEnums,
    bool? flatModelDir,
    bool? preserveUnknownEnums,
  }) => Quirks(
    dynamicJson: dynamicJson ?? this.dynamicJson,
    mutableModels: mutableModels ?? this.mutableModels,
    allListsDefaultToEmpty:
        allListsDefaultToEmpty ?? this.allListsDefaultToEmpty,
    screamingCapsEnums: screamingCapsEnums ?? this.screamingCapsEnums,
    flatModelDir: flatModelDir ?? this.flatModelDir,
    preserveUnknownEnums: preserveUnknownEnums ?? this.preserveUnknownEnums,
  );
}
