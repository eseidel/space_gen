// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// A notation of whether a dependency is requested directly by this manifest or
/// is a dependency of another dependency.
/// Example: `'direct'`
enum DependencyRelationship {
  direct._('direct'),
  indirect._('indirect');

  const DependencyRelationship._(this.value);

  /// Creates a DependencyRelationship from a json value.
  factory DependencyRelationship.fromJson(String json) {
    return DependencyRelationship.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown DependencyRelationship value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependencyRelationship? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DependencyRelationship.fromJson(json);
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
