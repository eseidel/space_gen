// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The organization policy for allowing or blocking suggestions matching public
/// code (duplication detection filter).
enum CopilotOrganizationDetailsPublicCodeSuggestions {
  allow._('allow'),
  block._('block'),
  unconfigured._('unconfigured');

  const CopilotOrganizationDetailsPublicCodeSuggestions._(this.value);

  /// Creates a CopilotOrganizationDetailsPublicCodeSuggestions from a json value.
  factory CopilotOrganizationDetailsPublicCodeSuggestions.fromJson(
    String json,
  ) {
    return CopilotOrganizationDetailsPublicCodeSuggestions.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CopilotOrganizationDetailsPublicCodeSuggestions value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CopilotOrganizationDetailsPublicCodeSuggestions? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotOrganizationDetailsPublicCodeSuggestions.fromJson(json);
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
