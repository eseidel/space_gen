enum AppsListAccountsForPlanStubbedDirection {
  asc._('asc'),
  desc._('desc');

  const AppsListAccountsForPlanStubbedDirection._(this.value);

  /// Creates a AppsListAccountsForPlanStubbedDirection from a json value.
  factory AppsListAccountsForPlanStubbedDirection.fromJson(String json) {
    return AppsListAccountsForPlanStubbedDirection.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppsListAccountsForPlanStubbedDirection value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppsListAccountsForPlanStubbedDirection? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppsListAccountsForPlanStubbedDirection.fromJson(json);
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
