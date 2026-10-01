// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum SecurityProductParam {
  dependencyGraph._('dependency_graph'),
  dependabotAlerts._('dependabot_alerts'),
  dependabotSecurityUpdates._('dependabot_security_updates'),
  advancedSecurity._('advanced_security'),
  codeScanningDefaultSetup._('code_scanning_default_setup'),
  secretScanning._('secret_scanning'),
  secretScanningPushProtection._('secret_scanning_push_protection');

  const SecurityProductParam._(this.value);

  /// Creates a SecurityProductParam from a json value.
  factory SecurityProductParam.fromJson(String json) {
    return SecurityProductParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SecurityProductParam value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecurityProductParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SecurityProductParam.fromJson(json);
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
