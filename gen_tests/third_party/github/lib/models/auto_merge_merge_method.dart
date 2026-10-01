// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The merge method to use.
enum AutoMergeMergeMethod {
  merge._('merge'),
  squash._('squash'),
  rebase._('rebase');

  const AutoMergeMergeMethod._(this.value);

  /// Creates a AutoMergeMergeMethod from a json value.
  factory AutoMergeMergeMethod.fromJson(String json) {
    return AutoMergeMergeMethod.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AutoMergeMergeMethod value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AutoMergeMergeMethod? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AutoMergeMergeMethod.fromJson(json);
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
