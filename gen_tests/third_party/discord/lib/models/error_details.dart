sealed class ErrorDetails {
  static ErrorDetails fromJson(dynamic jsonArg) {
    // Determine which schema to use based on the json.
    // TODO(eseidel): Implement this.
    throw UnimplementedError('ErrorDetails.fromJson');
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ErrorDetails? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ErrorDetails.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
