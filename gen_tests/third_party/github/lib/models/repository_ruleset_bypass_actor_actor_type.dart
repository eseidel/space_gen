/// The type of actor that can bypass a ruleset.
enum RepositoryRulesetBypassActorActorType {
  integration._('Integration'),
  organizationAdmin._('OrganizationAdmin'),
  repositoryRole._('RepositoryRole'),
  team._('Team'),
  deployKey._('DeployKey');

  const RepositoryRulesetBypassActorActorType._(this.value);

  /// Creates a RepositoryRulesetBypassActorActorType from a json value.
  factory RepositoryRulesetBypassActorActorType.fromJson(String json) {
    return RepositoryRulesetBypassActorActorType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRulesetBypassActorActorType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRulesetBypassActorActorType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetBypassActorActorType.fromJson(json);
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
