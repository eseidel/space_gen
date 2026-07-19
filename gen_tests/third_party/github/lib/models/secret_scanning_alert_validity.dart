/// The token status as of the latest validity check.
enum SecretScanningAlertValidity {
  active._('active'),
  inactive._('inactive'),
  unknown._('unknown');

  const SecretScanningAlertValidity._(this.value);

  /// Creates a SecretScanningAlertValidity from a json value.
  factory SecretScanningAlertValidity.fromJson(String json) {
    return SecretScanningAlertValidity.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecretScanningAlertValidity value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecretScanningAlertValidity? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SecretScanningAlertValidity.fromJson(json);
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
