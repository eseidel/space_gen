// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum ActionsCacheListSortParam {
  createdAt._('created_at'),
  lastAccessedAt._('last_accessed_at'),
  sizeInBytes._('size_in_bytes');

  const ActionsCacheListSortParam._(this.value);

  /// Creates a ActionsCacheListSortParam from a json value.
  factory ActionsCacheListSortParam.fromJson(String json) {
    return ActionsCacheListSortParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ActionsCacheListSortParam value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ActionsCacheListSortParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ActionsCacheListSortParam.fromJson(json);
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
