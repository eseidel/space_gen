sealed class PollLayoutTypes {
  const PollLayoutTypes();

  factory PollLayoutTypes.fromJson(dynamic json) {
    return switch (json) {
      _ => throw FormatException(
        'Unsupported shape for PollLayoutTypes: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PollLayoutTypes? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return PollLayoutTypes.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
