/// `pending` files have not yet been processed, while `complete` means results
/// from the SARIF have been stored. `failed` files have either not been
/// processed at all, or could only be partially processed.
enum CodeScanningSarifsStatusProcessingStatus {
  pending._('pending'),
  complete._('complete'),
  failed._('failed');

  const CodeScanningSarifsStatusProcessingStatus._(this.value);

  /// Creates a CodeScanningSarifsStatusProcessingStatus from a json value.
  factory CodeScanningSarifsStatusProcessingStatus.fromJson(String json) {
    return CodeScanningSarifsStatusProcessingStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningSarifsStatusProcessingStatus value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningSarifsStatusProcessingStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningSarifsStatusProcessingStatus.fromJson(json);
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
