// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The reason for bypassing push protection.
enum SecretScanningPushProtectionBypassReason {
  falsePositive._('false_positive'),
  usedInTests._('used_in_tests'),
  willFixLater._('will_fix_later');

  const SecretScanningPushProtectionBypassReason._(this.value);

  /// Creates a SecretScanningPushProtectionBypassReason from a json value.
  factory SecretScanningPushProtectionBypassReason.fromJson(String json) {
    return SecretScanningPushProtectionBypassReason.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecretScanningPushProtectionBypassReason value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecretScanningPushProtectionBypassReason? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SecretScanningPushProtectionBypassReason.fromJson(json);
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
