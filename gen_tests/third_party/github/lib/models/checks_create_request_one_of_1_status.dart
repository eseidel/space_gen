enum ChecksCreateRequestOneOf1Status {
  queued._('queued'),
  inProgress._('in_progress');

  const ChecksCreateRequestOneOf1Status._(this.value);

  /// Creates a ChecksCreateRequestOneOf1Status from a json value.
  factory ChecksCreateRequestOneOf1Status.fromJson(String json) {
    return ChecksCreateRequestOneOf1Status.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ChecksCreateRequestOneOf1Status value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ChecksCreateRequestOneOf1Status? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ChecksCreateRequestOneOf1Status.fromJson(json);
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
