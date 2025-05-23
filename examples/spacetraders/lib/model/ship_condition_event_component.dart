enum ShipConditionEventComponent {
  FRAME('FRAME'),
  REACTOR('REACTOR'),
  ENGINE('ENGINE');

  const ShipConditionEventComponent(this.value);

  factory ShipConditionEventComponent.fromJson(String json) {
    return ShipConditionEventComponent.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () =>
              throw Exception(
                'Unknown ShipConditionEventComponent value: $json',
              ),
    );
  }

  final String value;

  String toJson() => value;
}
