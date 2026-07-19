/// The type of repositories in the organization that the secret is visible to
enum CodespacesOrgSecretVisibility {
  all._('all'),
  private._('private'),
  selected._('selected');

  const CodespacesOrgSecretVisibility._(this.value);

  /// Creates a CodespacesOrgSecretVisibility from a json value.
  factory CodespacesOrgSecretVisibility.fromJson(String json) {
    return CodespacesOrgSecretVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodespacesOrgSecretVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodespacesOrgSecretVisibility? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodespacesOrgSecretVisibility.fromJson(json);
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
