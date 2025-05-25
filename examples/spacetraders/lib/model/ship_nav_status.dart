enum ShipNavStatus {
  IN_TRANSIT._('IN_TRANSIT'),
  IN_ORBIT._('IN_ORBIT'),
  DOCKED._('DOCKED');

  const ShipNavStatus._(this.value);

  factory ShipNavStatus.fromJson(String json) {
    return ShipNavStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown ShipNavStatus value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipNavStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipNavStatus.fromJson(json);
  }

  final String value;

  String toJson() => value;
}
