enum ButtonStyleTypes {
  primary._(1),
  secondary._(2),
  success._(3),
  danger._(4),
  link._(5),
  premium._(6);

  const ButtonStyleTypes._(this.value);

  /// Creates a ButtonStyleTypes from a json value.
  factory ButtonStyleTypes.fromJson(int json) {
    return ButtonStyleTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ButtonStyleTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ButtonStyleTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ButtonStyleTypes.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final int value;

  /// Converts the enum to its json value.
  int toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value.toString();
}
