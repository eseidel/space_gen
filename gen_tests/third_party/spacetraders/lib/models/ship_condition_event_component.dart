enum ShipConditionEventComponent {
  frame._('FRAME'),
  reactor._('REACTOR'),
  engine._('ENGINE');

  const ShipConditionEventComponent._(this.value);

  /// Creates a ShipConditionEventComponent from a json value.
  factory ShipConditionEventComponent.fromJson(String json) {
    return ShipConditionEventComponent.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ShipConditionEventComponent value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ShipConditionEventComponent? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipConditionEventComponent.fromJson(json);
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
