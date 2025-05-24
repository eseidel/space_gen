extension type ShipComponentCondition(double value) {
  factory ShipComponentCondition.fromJson(num json) =>
      ShipComponentCondition(json.toDouble());

  double toJson() => value;
}
