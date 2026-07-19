/// The type of repositories in the organization that the secret is visible to
enum CodespacesSecretVisibility {
  all._('all'),
  private._('private'),
  selected._('selected');

  const CodespacesSecretVisibility._(this.value);

  /// Creates a CodespacesSecretVisibility from a json value.
  factory CodespacesSecretVisibility.fromJson(String json) {
    return CodespacesSecretVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodespacesSecretVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodespacesSecretVisibility? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodespacesSecretVisibility.fromJson(json);
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
