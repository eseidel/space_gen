/// The type of GitHub user that can comment, open issues, or create pull
/// requests while the interaction limit is in effect.
/// Example: `'collaborators_only'`
enum InteractionGroup {
  existingUsers._('existing_users'),
  contributorsOnly._('contributors_only'),
  collaboratorsOnly._('collaborators_only');

  const InteractionGroup._(this.value);

  /// Creates a InteractionGroup from a json value.
  factory InteractionGroup.fromJson(String json) {
    return InteractionGroup.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown InteractionGroup value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static InteractionGroup? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return InteractionGroup.fromJson(json);
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
