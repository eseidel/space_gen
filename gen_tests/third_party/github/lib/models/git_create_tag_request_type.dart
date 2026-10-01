// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The type of the object we're tagging. Normally this is a `commit` but it can
/// also be a `tree` or a `blob`.
enum GitCreateTagRequestType {
  commit._('commit'),
  tree._('tree'),
  blob._('blob');

  const GitCreateTagRequestType._(this.value);

  /// Creates a GitCreateTagRequestType from a json value.
  factory GitCreateTagRequestType.fromJson(String json) {
    return GitCreateTagRequestType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown GitCreateTagRequestType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GitCreateTagRequestType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return GitCreateTagRequestType.fromJson(json);
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
