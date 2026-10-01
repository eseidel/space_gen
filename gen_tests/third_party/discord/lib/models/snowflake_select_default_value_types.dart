// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum SnowflakeSelectDefaultValueTypes {
  user._('user'),
  role._('role'),
  channel._('channel');

  const SnowflakeSelectDefaultValueTypes._(this.value);

  /// Creates a SnowflakeSelectDefaultValueTypes from a json value.
  factory SnowflakeSelectDefaultValueTypes.fromJson(String json) {
    return SnowflakeSelectDefaultValueTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SnowflakeSelectDefaultValueTypes value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SnowflakeSelectDefaultValueTypes? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SnowflakeSelectDefaultValueTypes.fromJson(json);
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
