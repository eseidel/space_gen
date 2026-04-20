enum UploadRichScalarsRequestVisibility {
  public._('public'),
  private._('private'),
  unlisted._('unlisted');

  const UploadRichScalarsRequestVisibility._(this.value);

  /// Creates a UploadRichScalarsRequestVisibility from a json string.
  factory UploadRichScalarsRequestVisibility.fromJson(String json) {
    return UploadRichScalarsRequestVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown UploadRichScalarsRequestVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UploadRichScalarsRequestVisibility? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return UploadRichScalarsRequestVisibility.fromJson(json);
  }

  /// The value of the enum, as a string.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to a json string.
  String toJson() => value;

  /// Returns the string value of the enum.
  @override
  String toString() => value;
}
