/// The target of the ruleset
enum ReposUpdateRepoRulesetRequestTarget {
  branch._('branch'),
  tag._('tag'),
  push._('push');

  const ReposUpdateRepoRulesetRequestTarget._(this.value);

  /// Creates a ReposUpdateRepoRulesetRequestTarget from a json value.
  factory ReposUpdateRepoRulesetRequestTarget.fromJson(String json) {
    return ReposUpdateRepoRulesetRequestTarget.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposUpdateRepoRulesetRequestTarget value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposUpdateRepoRulesetRequestTarget? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposUpdateRepoRulesetRequestTarget.fromJson(json);
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
