// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The severity of the advisory.
enum DependabotAlertSecurityAdvisorySeverity {
  low._('low'),
  medium._('medium'),
  high._('high'),
  critical._('critical');

  const DependabotAlertSecurityAdvisorySeverity._(this.value);

  /// Creates a DependabotAlertSecurityAdvisorySeverity from a json value.
  factory DependabotAlertSecurityAdvisorySeverity.fromJson(String json) {
    return DependabotAlertSecurityAdvisorySeverity.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DependabotAlertSecurityAdvisorySeverity value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependabotAlertSecurityAdvisorySeverity? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DependabotAlertSecurityAdvisorySeverity.fromJson(json);
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
