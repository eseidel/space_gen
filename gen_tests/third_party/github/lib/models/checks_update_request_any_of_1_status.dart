enum ChecksUpdateRequestAnyOf1Status {
  queued._('queued'),
  inProgress._('in_progress');

  const ChecksUpdateRequestAnyOf1Status._(this.value);

  /// Creates a ChecksUpdateRequestAnyOf1Status from a json value.
  factory ChecksUpdateRequestAnyOf1Status.fromJson(String json) {
    return ChecksUpdateRequestAnyOf1Status.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ChecksUpdateRequestAnyOf1Status value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ChecksUpdateRequestAnyOf1Status? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ChecksUpdateRequestAnyOf1Status.fromJson(json);
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
