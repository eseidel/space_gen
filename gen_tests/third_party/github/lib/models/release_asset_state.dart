/// State of the release asset.
enum ReleaseAssetState {
  uploaded._('uploaded'),
  open._('open');

  const ReleaseAssetState._(this.value);

  /// Creates a ReleaseAssetState from a json value.
  factory ReleaseAssetState.fromJson(String json) {
    return ReleaseAssetState.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ReleaseAssetState value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReleaseAssetState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReleaseAssetState.fromJson(json);
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
