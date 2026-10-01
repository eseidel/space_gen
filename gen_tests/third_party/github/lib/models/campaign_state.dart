// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// Campaign state
/// Indicates whether a campaign is open or closed
enum CampaignState {
  open._('open'),
  closed._('closed');

  const CampaignState._(this.value);

  /// Creates a CampaignState from a json value.
  factory CampaignState.fromJson(String json) {
    return CampaignState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown CampaignState value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CampaignState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CampaignState.fromJson(json);
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
