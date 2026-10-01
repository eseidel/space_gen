// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum ReposListForksParameter2 {
  newest._('newest'),
  oldest._('oldest'),
  stargazers._('stargazers'),
  watchers._('watchers');

  const ReposListForksParameter2._(this.value);

  /// Creates a ReposListForksParameter2 from a json value.
  factory ReposListForksParameter2.fromJson(String json) {
    return ReposListForksParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListForksParameter2 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListForksParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListForksParameter2.fromJson(json);
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
