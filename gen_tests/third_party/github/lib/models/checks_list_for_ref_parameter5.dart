// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum ChecksListForRefParameter5 {
  latest._('latest'),
  all._('all');

  const ChecksListForRefParameter5._(this.value);

  /// Creates a ChecksListForRefParameter5 from a json value.
  factory ChecksListForRefParameter5.fromJson(String json) {
    return ChecksListForRefParameter5.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ChecksListForRefParameter5 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ChecksListForRefParameter5? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ChecksListForRefParameter5.fromJson(json);
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
