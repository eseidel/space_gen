// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
