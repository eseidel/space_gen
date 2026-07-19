/// The visibility of the repository.
enum ReposCreateInOrgRequestVisibility {
  public._('public'),
  private._('private');

  const ReposCreateInOrgRequestVisibility._(this.value);

  /// Creates a ReposCreateInOrgRequestVisibility from a json value.
  factory ReposCreateInOrgRequestVisibility.fromJson(String json) {
    return ReposCreateInOrgRequestVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreateInOrgRequestVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateInOrgRequestVisibility? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateInOrgRequestVisibility.fromJson(json);
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
