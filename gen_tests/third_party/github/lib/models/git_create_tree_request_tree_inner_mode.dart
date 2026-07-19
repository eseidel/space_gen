/// The file mode; one of `100644` for file (blob), `100755` for executable
/// (blob), `040000` for subdirectory (tree), `160000` for submodule (commit),
/// or `120000` for a blob that specifies the path of a symlink.
enum GitCreateTreeRequestTreeInnerMode {
  n100644._('100644'),
  n100755._('100755'),
  n040000._('040000'),
  n160000._('160000'),
  n120000._('120000');

  const GitCreateTreeRequestTreeInnerMode._(this.value);

  /// Creates a GitCreateTreeRequestTreeInnerMode from a json value.
  factory GitCreateTreeRequestTreeInnerMode.fromJson(String json) {
    return GitCreateTreeRequestTreeInnerMode.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown GitCreateTreeRequestTreeInnerMode value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GitCreateTreeRequestTreeInnerMode? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return GitCreateTreeRequestTreeInnerMode.fromJson(json);
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
