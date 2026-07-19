// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The type of the bypass reviewer
enum CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInnerReviewerType {
  team._('TEAM'),
  role._('ROLE');

  const CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInnerReviewerType._(
    this.value,
  );

  /// Creates a CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInnerReviewerType from a json value.
  factory CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInnerReviewerType.fromJson(
    String json,
  ) {
    return CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInnerReviewerType
        .values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInnerReviewerType value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInnerReviewerType?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedBypassOptionsReviewersInnerReviewerType.fromJson(
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
