enum SecretScanningAlertSortParam {
  created._('created'),
  updated._('updated');

  const SecretScanningAlertSortParam._(this.value);

  /// Creates a SecretScanningAlertSortParam from a json value.
  factory SecretScanningAlertSortParam.fromJson(String json) {
    return SecretScanningAlertSortParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecretScanningAlertSortParam value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecretScanningAlertSortParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SecretScanningAlertSortParam.fromJson(json);
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
