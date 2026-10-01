// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The state of the advisory.
enum RepositoryAdvisoryUpdateState {
  published._('published'),
  closed._('closed'),
  draft._('draft');

  const RepositoryAdvisoryUpdateState._(this.value);

  /// Creates a RepositoryAdvisoryUpdateState from a json value.
  factory RepositoryAdvisoryUpdateState.fromJson(String json) {
    return RepositoryAdvisoryUpdateState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryAdvisoryUpdateState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryUpdateState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryUpdateState.fromJson(json);
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
