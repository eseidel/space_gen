extension type ShipComponentQuality(double value) {
  factory ShipComponentQuality.fromJson(num json) =>
      ShipComponentQuality(json.toDouble());

  double toJson() => value;
}
