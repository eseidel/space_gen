// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
enum DependabotAlertCommaSeparatedHasParamOneOf1Inner {
  patch._('patch');

  const DependabotAlertCommaSeparatedHasParamOneOf1Inner._(this.value);

  /// Creates a DependabotAlertCommaSeparatedHasParamOneOf1Inner from a json value.
  factory DependabotAlertCommaSeparatedHasParamOneOf1Inner.fromJson(
    String json,
  ) {
    return DependabotAlertCommaSeparatedHasParamOneOf1Inner.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DependabotAlertCommaSeparatedHasParamOneOf1Inner value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependabotAlertCommaSeparatedHasParamOneOf1Inner? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotAlertCommaSeparatedHasParamOneOf1Inner.fromJson(json);
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
