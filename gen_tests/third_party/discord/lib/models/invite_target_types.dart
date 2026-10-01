// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum InviteTargetTypes {
  stream._(1),
  embeddedApplication._(2),
  roleSubscriptionsPurchase._(3);

  const InviteTargetTypes._(this.value);

  /// Creates a InviteTargetTypes from a json value.
  factory InviteTargetTypes.fromJson(int json) {
    return InviteTargetTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown InviteTargetTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static InviteTargetTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return InviteTargetTypes.fromJson(json);
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
