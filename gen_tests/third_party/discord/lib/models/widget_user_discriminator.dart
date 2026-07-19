enum WidgetUserDiscriminator {
  zeroes._('0000');

  const WidgetUserDiscriminator._(this.value);

  /// Creates a WidgetUserDiscriminator from a json value.
  factory WidgetUserDiscriminator.fromJson(String json) {
    return WidgetUserDiscriminator.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown WidgetUserDiscriminator value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static WidgetUserDiscriminator? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return WidgetUserDiscriminator.fromJson(json);
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
