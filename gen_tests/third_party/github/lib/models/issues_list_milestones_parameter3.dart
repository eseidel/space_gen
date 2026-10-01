// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum IssuesListMilestonesParameter3 {
  dueOn._('due_on'),
  completeness._('completeness');

  const IssuesListMilestonesParameter3._(this.value);

  /// Creates a IssuesListMilestonesParameter3 from a json value.
  factory IssuesListMilestonesParameter3.fromJson(String json) {
    return IssuesListMilestonesParameter3.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListMilestonesParameter3 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListMilestonesParameter3? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListMilestonesParameter3.fromJson(json);
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
