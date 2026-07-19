enum EntitlementTenantFulfillmentStatusResponse {
  unknown._(0),
  fulfillmentNotNeeded._(1),
  fulfillmentNeeded._(2),
  fulfilled._(3),
  fulfillmentFailed._(4),
  unfulfillmentNeeded._(5),
  unfulfilled._(6),
  unfulfillmentFailed._(7);

  const EntitlementTenantFulfillmentStatusResponse._(this.value);

  /// Creates a EntitlementTenantFulfillmentStatusResponse from a json value.
  factory EntitlementTenantFulfillmentStatusResponse.fromJson(int json) {
    return EntitlementTenantFulfillmentStatusResponse.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown EntitlementTenantFulfillmentStatusResponse value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static EntitlementTenantFulfillmentStatusResponse? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return EntitlementTenantFulfillmentStatusResponse.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final int value;

  /// Converts the enum to its json value.
  int toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value.toString();
}
