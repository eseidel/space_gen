enum ShipConditionEventComponent {
  FRAME._('FRAME'),
  REACTOR._('REACTOR'),
  ENGINE._('ENGINE');

  const ShipConditionEventComponent._(this.value);

  factory ShipConditionEventComponent.fromJson(String json) {
    return ShipConditionEventComponent.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () =>
              throw FormatException(
                'Unknown ShipConditionEventComponent value: $json',
              ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipConditionEventComponent? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipConditionEventComponent.fromJson(json);
  }

  final String value;

  String toJson() => value;
}
