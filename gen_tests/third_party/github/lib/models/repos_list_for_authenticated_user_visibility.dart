enum ReposListForAuthenticatedUserVisibility {
  all._('all'),
  public._('public'),
  private._('private');

  const ReposListForAuthenticatedUserVisibility._(this.value);

  /// Creates a ReposListForAuthenticatedUserVisibility from a json value.
  factory ReposListForAuthenticatedUserVisibility.fromJson(String json) {
    return ReposListForAuthenticatedUserVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListForAuthenticatedUserVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForAuthenticatedUserVisibility? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForAuthenticatedUserVisibility.fromJson(json);
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
