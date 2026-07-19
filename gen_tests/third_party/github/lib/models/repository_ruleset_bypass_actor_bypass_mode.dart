/// When the specified actor can bypass the ruleset. `pull_request` means that
/// an actor can only bypass rules on pull requests. `pull_request` is not
/// applicable for the `DeployKey` actor type. Also, `pull_request` is only
/// applicable to branch rulesets.
enum RepositoryRulesetBypassActorBypassMode {
  always._('always'),
  pullRequest._('pull_request');

  const RepositoryRulesetBypassActorBypassMode._(this.value);

  /// Creates a RepositoryRulesetBypassActorBypassMode from a json value.
  factory RepositoryRulesetBypassActorBypassMode.fromJson(String json) {
    return RepositoryRulesetBypassActorBypassMode.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRulesetBypassActorBypassMode value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRulesetBypassActorBypassMode? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetBypassActorBypassMode.fromJson(json);
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
