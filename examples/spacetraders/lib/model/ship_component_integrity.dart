extension type ShipComponentIntegrity(double value) {
  factory ShipComponentIntegrity.fromJson(num json) =>
      ShipComponentIntegrity(json.toDouble());

  double toJson() => value;
}
