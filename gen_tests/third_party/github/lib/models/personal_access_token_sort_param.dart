enum PersonalAccessTokenSortParam {
  createdAt._('created_at');

  const PersonalAccessTokenSortParam._(this.value);

  /// Creates a PersonalAccessTokenSortParam from a json value.
  factory PersonalAccessTokenSortParam.fromJson(String json) {
    return PersonalAccessTokenSortParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PersonalAccessTokenSortParam value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PersonalAccessTokenSortParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PersonalAccessTokenSortParam.fromJson(json);
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
