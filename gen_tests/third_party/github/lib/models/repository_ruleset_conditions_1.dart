sealed class RepositoryRulesetConditions1 {
  static RepositoryRulesetConditions1 fromJson(dynamic jsonArg) {
    // Determine which schema to use based on the json.
    // TODO(eseidel): Implement this.
    throw UnimplementedError('RepositoryRulesetConditions1.fromJson');
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRulesetConditions1? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetConditions1.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
