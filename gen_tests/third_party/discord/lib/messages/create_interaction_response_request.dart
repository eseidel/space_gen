sealed class CreateInteractionResponseRequest {
  static CreateInteractionResponseRequest fromJson(dynamic jsonArg) {
    // Determine which schema to use based on the json.
    // TODO(eseidel): Implement this.
    throw UnimplementedError('CreateInteractionResponseRequest.fromJson');
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateInteractionResponseRequest? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return CreateInteractionResponseRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
