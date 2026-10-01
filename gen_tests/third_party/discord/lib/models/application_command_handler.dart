// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
sealed class ApplicationCommandHandler {
  const ApplicationCommandHandler();

  factory ApplicationCommandHandler.fromJson(dynamic json) {
    return switch (json) {
      _ => throw FormatException(
        'Unsupported shape for ApplicationCommandHandler: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandHandler? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandHandler.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
