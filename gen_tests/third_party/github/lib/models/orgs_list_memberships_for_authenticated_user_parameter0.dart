// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
enum OrgsListMembershipsForAuthenticatedUserParameter0 {
  active._('active'),
  pending._('pending');

  const OrgsListMembershipsForAuthenticatedUserParameter0._(this.value);

  /// Creates a OrgsListMembershipsForAuthenticatedUserParameter0 from a json value.
  factory OrgsListMembershipsForAuthenticatedUserParameter0.fromJson(
    String json,
  ) {
    return OrgsListMembershipsForAuthenticatedUserParameter0.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsListMembershipsForAuthenticatedUserParameter0 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsListMembershipsForAuthenticatedUserParameter0? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsListMembershipsForAuthenticatedUserParameter0.fromJson(json);
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
