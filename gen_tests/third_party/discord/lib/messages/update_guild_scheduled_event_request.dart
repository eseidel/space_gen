// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
sealed class UpdateGuildScheduledEventRequest {
  static UpdateGuildScheduledEventRequest fromJson(dynamic jsonArg) {
    // Determine which schema to use based on the json.
    // TODO(eseidel): Implement this.
    throw UnimplementedError('UpdateGuildScheduledEventRequest.fromJson');
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateGuildScheduledEventRequest? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return UpdateGuildScheduledEventRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
