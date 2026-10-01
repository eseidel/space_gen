// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
