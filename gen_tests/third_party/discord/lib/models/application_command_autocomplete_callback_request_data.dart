sealed class ApplicationCommandAutocompleteCallbackRequestData {
  static ApplicationCommandAutocompleteCallbackRequestData fromJson(
    dynamic jsonArg,
  ) {
    // Determine which schema to use based on the json.
    // TODO(eseidel): Implement this.
    throw UnimplementedError(
      'ApplicationCommandAutocompleteCallbackRequestData.fromJson',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandAutocompleteCallbackRequestData? maybeFromJson(
    dynamic json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandAutocompleteCallbackRequestData.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
