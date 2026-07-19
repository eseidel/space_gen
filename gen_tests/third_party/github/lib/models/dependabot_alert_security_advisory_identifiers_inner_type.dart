// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The type of advisory identifier.
enum DependabotAlertSecurityAdvisoryIdentifiersInnerType {
  cve._('CVE'),
  ghsa._('GHSA');

  const DependabotAlertSecurityAdvisoryIdentifiersInnerType._(this.value);

  /// Creates a DependabotAlertSecurityAdvisoryIdentifiersInnerType from a json value.
  factory DependabotAlertSecurityAdvisoryIdentifiersInnerType.fromJson(
    String json,
  ) {
    return DependabotAlertSecurityAdvisoryIdentifiersInnerType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DependabotAlertSecurityAdvisoryIdentifiersInnerType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependabotAlertSecurityAdvisoryIdentifiersInnerType? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotAlertSecurityAdvisoryIdentifiersInnerType.fromJson(json);
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
