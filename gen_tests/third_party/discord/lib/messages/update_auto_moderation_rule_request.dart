sealed class UpdateAutoModerationRuleRequest {
  static UpdateAutoModerationRuleRequest fromJson(dynamic jsonArg) {
    // Determine which schema to use based on the json.
    // TODO(eseidel): Implement this.
    throw UnimplementedError('UpdateAutoModerationRuleRequest.fromJson');
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateAutoModerationRuleRequest? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return UpdateAutoModerationRuleRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
