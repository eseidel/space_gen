/// The target of the ruleset
enum ReposUpdateOrgRulesetRequestTarget {
  branch._('branch'),
  tag._('tag'),
  push._('push'),
  repository._('repository');

  const ReposUpdateOrgRulesetRequestTarget._(this.value);

  /// Creates a ReposUpdateOrgRulesetRequestTarget from a json value.
  factory ReposUpdateOrgRulesetRequestTarget.fromJson(String json) {
    return ReposUpdateOrgRulesetRequestTarget.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposUpdateOrgRulesetRequestTarget value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposUpdateOrgRulesetRequestTarget? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposUpdateOrgRulesetRequestTarget.fromJson(json);
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
