// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// Type of repository selection requested.
enum OrganizationProgrammaticAccessGrantRequestRepositorySelection {
  none._('none'),
  all._('all'),
  subset._('subset');

  const OrganizationProgrammaticAccessGrantRequestRepositorySelection._(
    this.value,
  );

  /// Creates a OrganizationProgrammaticAccessGrantRequestRepositorySelection from a json value.
  factory OrganizationProgrammaticAccessGrantRequestRepositorySelection.fromJson(
    String json,
  ) {
    return OrganizationProgrammaticAccessGrantRequestRepositorySelection.values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown OrganizationProgrammaticAccessGrantRequestRepositorySelection value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrganizationProgrammaticAccessGrantRequestRepositorySelection?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrganizationProgrammaticAccessGrantRequestRepositorySelection.fromJson(
      json,
    );
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
