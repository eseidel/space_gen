enum Status {
  active._('active'),
  inactive._('inactive'),
  pending._('pending');

  const Status._(this.value);

  /// Creates a Status from a json value.
  factory Status.fromJson(String json) {
    return Status.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown Status value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static Status? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return Status.fromJson(json);
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
