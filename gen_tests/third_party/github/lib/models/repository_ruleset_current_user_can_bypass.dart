// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The bypass type of the user making the API request for this ruleset. This
/// field is only returned when
/// querying the repository-level endpoint.
enum RepositoryRulesetCurrentUserCanBypass {
  always._('always'),
  pullRequestsOnly._('pull_requests_only'),
  never._('never');

  const RepositoryRulesetCurrentUserCanBypass._(this.value);

  /// Creates a RepositoryRulesetCurrentUserCanBypass from a json value.
  factory RepositoryRulesetCurrentUserCanBypass.fromJson(String json) {
    return RepositoryRulesetCurrentUserCanBypass.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRulesetCurrentUserCanBypass value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRulesetCurrentUserCanBypass? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetCurrentUserCanBypass.fromJson(json);
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
