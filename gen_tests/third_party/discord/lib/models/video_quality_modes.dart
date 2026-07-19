enum VideoQualityModes {
  /// Discord chooses the quality for optimal performance
  auto._(1),

  /// 720p
  full._(2);

  const VideoQualityModes._(this.value);

  /// Creates a VideoQualityModes from a json value.
  factory VideoQualityModes.fromJson(int json) {
    return VideoQualityModes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown VideoQualityModes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static VideoQualityModes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return VideoQualityModes.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final int value;

  /// Converts the enum to its json value.
  int toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value.toString();
}
