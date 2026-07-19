/// Either `blob`, `tree`, or `commit`.
enum GitCreateTreeRequestTreeInnerType {
  blob._('blob'),
  tree._('tree'),
  commit._('commit');

  const GitCreateTreeRequestTreeInnerType._(this.value);

  /// Creates a GitCreateTreeRequestTreeInnerType from a json value.
  factory GitCreateTreeRequestTreeInnerType.fromJson(String json) {
    return GitCreateTreeRequestTreeInnerType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown GitCreateTreeRequestTreeInnerType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GitCreateTreeRequestTreeInnerType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return GitCreateTreeRequestTreeInnerType.fromJson(json);
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
