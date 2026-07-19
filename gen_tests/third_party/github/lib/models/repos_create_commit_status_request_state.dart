/// The state of the status.
enum ReposCreateCommitStatusRequestState {
  error._('error'),
  failure._('failure'),
  pending._('pending'),
  success._('success');

  const ReposCreateCommitStatusRequestState._(this.value);

  /// Creates a ReposCreateCommitStatusRequestState from a json value.
  factory ReposCreateCommitStatusRequestState.fromJson(String json) {
    return ReposCreateCommitStatusRequestState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreateCommitStatusRequestState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateCommitStatusRequestState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateCommitStatusRequestState.fromJson(json);
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
