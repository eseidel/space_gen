/// The overall quality of the component, which determines the quality of the
/// component. High quality components return more ships parts and ship plating
/// when a ship is scrapped. But also require more of these parts to repair.
/// This is transparent to the player, as the parts are bought from/sold to the
/// marketplace.
extension type const ShipComponentQuality._(double value) {
  const ShipComponentQuality(this.value);

  factory ShipComponentQuality.fromJson(num json) =>
      ShipComponentQuality(json.toDouble());

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipComponentQuality? maybeFromJson(num? json) {
    if (json == null) {
      return null;
    }
    return ShipComponentQuality.fromJson(json);
  }

  double toJson() => value;
}
