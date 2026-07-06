enum UploadRichScalarsRequestVisibility {
  public._('public'),
  private._('private'),
  unlisted._('unlisted');

  const UploadRichScalarsRequestVisibility._(this.value);

  /// Creates a UploadRichScalarsRequestVisibility from a json value.
  factory UploadRichScalarsRequestVisibility.fromJson(String json) {
    return UploadRichScalarsRequestVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown UploadRichScalarsRequestVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static UploadRichScalarsRequestVisibility? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return UploadRichScalarsRequestVisibility.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
