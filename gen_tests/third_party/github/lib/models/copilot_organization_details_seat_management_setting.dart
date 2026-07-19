// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The mode of assigning new seats.
enum CopilotOrganizationDetailsSeatManagementSetting {
  assignAll._('assign_all'),
  assignSelected._('assign_selected'),
  disabled._('disabled'),
  unconfigured._('unconfigured');

  const CopilotOrganizationDetailsSeatManagementSetting._(this.value);

  /// Creates a CopilotOrganizationDetailsSeatManagementSetting from a json value.
  factory CopilotOrganizationDetailsSeatManagementSetting.fromJson(
    String json,
  ) {
    return CopilotOrganizationDetailsSeatManagementSetting.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CopilotOrganizationDetailsSeatManagementSetting value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CopilotOrganizationDetailsSeatManagementSetting? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotOrganizationDetailsSeatManagementSetting.fromJson(json);
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
