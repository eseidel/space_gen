sealed class NameplatePalette {
  const NameplatePalette();

  factory NameplatePalette.fromJson(dynamic json) {
    return switch (json) {
      _ => throw FormatException(
        'Unsupported shape for NameplatePalette: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static NameplatePalette? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return NameplatePalette.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
