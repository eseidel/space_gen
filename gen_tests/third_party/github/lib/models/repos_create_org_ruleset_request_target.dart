/// The target of the ruleset
enum ReposCreateOrgRulesetRequestTarget {
  branch._('branch'),
  tag._('tag'),
  push._('push'),
  repository._('repository');

  const ReposCreateOrgRulesetRequestTarget._(this.value);

  /// Creates a ReposCreateOrgRulesetRequestTarget from a json value.
  factory ReposCreateOrgRulesetRequestTarget.fromJson(String json) {
    return ReposCreateOrgRulesetRequestTarget.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreateOrgRulesetRequestTarget value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateOrgRulesetRequestTarget? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateOrgRulesetRequestTarget.fromJson(json);
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
