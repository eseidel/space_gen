enum OrgSecurityProductEnablementParam {
  enableAll._('enable_all'),
  disableAll._('disable_all');

  const OrgSecurityProductEnablementParam._(this.value);

  /// Creates a OrgSecurityProductEnablementParam from a json value.
  factory OrgSecurityProductEnablementParam.fromJson(String json) {
    return OrgSecurityProductEnablementParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgSecurityProductEnablementParam value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgSecurityProductEnablementParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgSecurityProductEnablementParam.fromJson(json);
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
