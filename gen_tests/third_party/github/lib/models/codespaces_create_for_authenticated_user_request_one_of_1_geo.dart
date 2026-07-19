// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The geographic area for this codespace. If not specified, the value is
/// assigned by IP. This property replaces `location`, which is closing down.
enum CodespacesCreateForAuthenticatedUserRequestOneOf1Geo {
  europeWest._('EuropeWest'),
  southeastAsia._('SoutheastAsia'),
  usEast._('UsEast'),
  usWest._('UsWest');

  const CodespacesCreateForAuthenticatedUserRequestOneOf1Geo._(this.value);

  /// Creates a CodespacesCreateForAuthenticatedUserRequestOneOf1Geo from a json value.
  factory CodespacesCreateForAuthenticatedUserRequestOneOf1Geo.fromJson(
    String json,
  ) {
    return CodespacesCreateForAuthenticatedUserRequestOneOf1Geo.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodespacesCreateForAuthenticatedUserRequestOneOf1Geo value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodespacesCreateForAuthenticatedUserRequestOneOf1Geo? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesCreateForAuthenticatedUserRequestOneOf1Geo.fromJson(json);
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
