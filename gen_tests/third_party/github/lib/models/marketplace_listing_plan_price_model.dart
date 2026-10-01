// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// Example: `'FLAT_RATE'`
enum MarketplaceListingPlanPriceModel {
  free._('FREE'),
  flatRate._('FLAT_RATE'),
  perUnit._('PER_UNIT');

  const MarketplaceListingPlanPriceModel._(this.value);

  /// Creates a MarketplaceListingPlanPriceModel from a json value.
  factory MarketplaceListingPlanPriceModel.fromJson(String json) {
    return MarketplaceListingPlanPriceModel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown MarketplaceListingPlanPriceModel value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MarketplaceListingPlanPriceModel? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MarketplaceListingPlanPriceModel.fromJson(json);
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
