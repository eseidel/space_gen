enum AppsListAccountsForPlanStubbedParameter2 {
  asc._('asc'),
  desc._('desc');

  const AppsListAccountsForPlanStubbedParameter2._(this.value);

  /// Creates a AppsListAccountsForPlanStubbedParameter2 from a json value.
  factory AppsListAccountsForPlanStubbedParameter2.fromJson(String json) {
    return AppsListAccountsForPlanStubbedParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppsListAccountsForPlanStubbedParameter2 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppsListAccountsForPlanStubbedParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppsListAccountsForPlanStubbedParameter2.fromJson(json);
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
