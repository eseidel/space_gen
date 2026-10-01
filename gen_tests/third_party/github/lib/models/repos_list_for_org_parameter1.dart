// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum ReposListForOrgParameter1 {
  all._('all'),
  public._('public'),
  private._('private'),
  forks._('forks'),
  sources._('sources'),
  member._('member');

  const ReposListForOrgParameter1._(this.value);

  /// Creates a ReposListForOrgParameter1 from a json value.
  factory ReposListForOrgParameter1.fromJson(String json) {
    return ReposListForOrgParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListForOrgParameter1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForOrgParameter1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForOrgParameter1.fromJson(json);
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
