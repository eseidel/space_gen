enum MetadataItemTypes {
  /// the metadata value (integer) is less than or equal to the guild's
  /// configured value (integer)
  integerLessThanEqual._(1),

  /// the metadata value (integer) is greater than or equal to the guild's
  /// configured value (integer)
  integerGreaterThanEqual._(2),

  /// the metadata value (integer) is equal to the guild's configured value
  /// (integer)
  integerEqual._(3),

  /// the metadata value (integer) is not equal to the guild's configured
  /// value (integer)
  integerNotEqual._(4),

  /// the metadata value (ISO8601 string) is less than or equal to the guild's
  /// configured value (integer; days before current date)
  datetimeLessThanEqual._(5),

  /// the metadata value (ISO8601 string) is greater than or equal to the
  /// guild's configured value (integer; days before current date)
  datetimeGreaterThanEqual._(6),

  /// the metadata value (integer) is equal to the guild's configured value
  /// (integer; 1)
  booleanEqual._(7),

  /// the metadata value (integer) is not equal to the guild's configured
  /// value (integer; 1)
  booleanNotEqual._(8);

  const MetadataItemTypes._(this.value);

  /// Creates a MetadataItemTypes from a json value.
  factory MetadataItemTypes.fromJson(int json) {
    return MetadataItemTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown MetadataItemTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MetadataItemTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return MetadataItemTypes.fromJson(json);
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
