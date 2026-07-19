enum ChecksCreateRequestOneOf0Status {
  completed._('completed');

  const ChecksCreateRequestOneOf0Status._(this.value);

  /// Creates a ChecksCreateRequestOneOf0Status from a json value.
  factory ChecksCreateRequestOneOf0Status.fromJson(String json) {
    return ChecksCreateRequestOneOf0Status.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ChecksCreateRequestOneOf0Status value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ChecksCreateRequestOneOf0Status? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ChecksCreateRequestOneOf0Status.fromJson(json);
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
