/// The state of the user's acceptance of the credit.
enum RepositoryAdvisoryCreditState {
  accepted._('accepted'),
  declined._('declined'),
  pending._('pending');

  const RepositoryAdvisoryCreditState._(this.value);

  /// Creates a RepositoryAdvisoryCreditState from a json value.
  factory RepositoryAdvisoryCreditState.fromJson(String json) {
    return RepositoryAdvisoryCreditState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryAdvisoryCreditState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryCreditState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryCreditState.fromJson(json);
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
