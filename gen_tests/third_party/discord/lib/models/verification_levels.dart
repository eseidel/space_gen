enum VerificationLevels {
  /// unrestricted
  none._(0),

  /// must have verified email on account
  low._(1),

  /// must be registered on Discord for longer than 5 minutes
  medium._(2),

  /// must be a member of the server for longer than 10 minutes
  high._(3),

  /// must have a verified phone number
  veryHigh._(4);

  const VerificationLevels._(this.value);

  /// Creates a VerificationLevels from a json value.
  factory VerificationLevels.fromJson(int json) {
    return VerificationLevels.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown VerificationLevels value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static VerificationLevels? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return VerificationLevels.fromJson(json);
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
