/// The permissions policy that controls the actions and reusable workflows that
/// are allowed to run.
enum AllowedActions {
  all._('all'),
  localOnly._('local_only'),
  selected._('selected');

  const AllowedActions._(this.value);

  /// Creates a AllowedActions from a json value.
  factory AllowedActions.fromJson(String json) {
    return AllowedActions.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AllowedActions value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AllowedActions? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AllowedActions.fromJson(json);
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
