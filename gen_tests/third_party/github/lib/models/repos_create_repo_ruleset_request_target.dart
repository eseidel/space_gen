/// The target of the ruleset
enum ReposCreateRepoRulesetRequestTarget {
  branch._('branch'),
  tag._('tag'),
  push._('push');

  const ReposCreateRepoRulesetRequestTarget._(this.value);

  /// Creates a ReposCreateRepoRulesetRequestTarget from a json value.
  factory ReposCreateRepoRulesetRequestTarget.fromJson(String json) {
    return ReposCreateRepoRulesetRequestTarget.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreateRepoRulesetRequestTarget value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateRepoRulesetRequestTarget? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateRepoRulesetRequestTarget.fromJson(json);
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
