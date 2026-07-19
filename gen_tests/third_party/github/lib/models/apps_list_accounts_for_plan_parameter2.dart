enum AppsListAccountsForPlanParameter2 {
  asc._('asc'),
  desc._('desc');

  const AppsListAccountsForPlanParameter2._(this.value);

  /// Creates a AppsListAccountsForPlanParameter2 from a json value.
  factory AppsListAccountsForPlanParameter2.fromJson(String json) {
    return AppsListAccountsForPlanParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppsListAccountsForPlanParameter2 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppsListAccountsForPlanParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppsListAccountsForPlanParameter2.fromJson(json);
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
