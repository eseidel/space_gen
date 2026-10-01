// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The registered role of the ship
enum ShipRole {
  fabricator._('FABRICATOR'),
  harvester._('HARVESTER'),
  hauler._('HAULER'),
  interceptor._('INTERCEPTOR'),
  excavator._('EXCAVATOR'),
  transport._('TRANSPORT'),
  repair._('REPAIR'),
  surveyor._('SURVEYOR'),
  command._('COMMAND'),
  carrier._('CARRIER'),
  patrol._('PATROL'),
  satellite._('SATELLITE'),
  explorer._('EXPLORER'),
  refinery._('REFINERY');

  const ShipRole._(this.value);

  /// Creates a ShipRole from a json value.
  factory ShipRole.fromJson(String json) {
    return ShipRole.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown ShipRole value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ShipRole? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipRole.fromJson(json);
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
