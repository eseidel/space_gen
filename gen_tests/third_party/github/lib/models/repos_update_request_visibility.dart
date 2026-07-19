/// The visibility of the repository.
enum ReposUpdateRequestVisibility {
  public._('public'),
  private._('private');

  const ReposUpdateRequestVisibility._(this.value);

  /// Creates a ReposUpdateRequestVisibility from a json value.
  factory ReposUpdateRequestVisibility.fromJson(String json) {
    return ReposUpdateRequestVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposUpdateRequestVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposUpdateRequestVisibility? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposUpdateRequestVisibility.fromJson(json);
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
