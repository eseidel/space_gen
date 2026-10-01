// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum IssuesListForAuthenticatedUserParameter0 {
  assigned._('assigned'),
  created._('created'),
  mentioned._('mentioned'),
  subscribed._('subscribed'),
  repos._('repos'),
  all._('all');

  const IssuesListForAuthenticatedUserParameter0._(this.value);

  /// Creates a IssuesListForAuthenticatedUserParameter0 from a json value.
  factory IssuesListForAuthenticatedUserParameter0.fromJson(String json) {
    return IssuesListForAuthenticatedUserParameter0.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListForAuthenticatedUserParameter0 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListForAuthenticatedUserParameter0? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListForAuthenticatedUserParameter0.fromJson(json);
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
