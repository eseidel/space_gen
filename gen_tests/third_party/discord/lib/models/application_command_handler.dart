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
