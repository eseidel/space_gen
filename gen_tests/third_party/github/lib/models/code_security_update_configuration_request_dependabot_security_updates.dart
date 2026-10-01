// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The enablement status of Dependabot security updates
enum CodeSecurityUpdateConfigurationRequestDependabotSecurityUpdates {
  enabled._('enabled'),
  disabled._('disabled'),
  notSet._('not_set');

  const CodeSecurityUpdateConfigurationRequestDependabotSecurityUpdates._(
    this.value,
  );

  /// Creates a CodeSecurityUpdateConfigurationRequestDependabotSecurityUpdates from a json value.
  factory CodeSecurityUpdateConfigurationRequestDependabotSecurityUpdates.fromJson(
    String json,
  ) {
    return CodeSecurityUpdateConfigurationRequestDependabotSecurityUpdates
        .values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown CodeSecurityUpdateConfigurationRequestDependabotSecurityUpdates value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityUpdateConfigurationRequestDependabotSecurityUpdates?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityUpdateConfigurationRequestDependabotSecurityUpdates.fromJson(
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
