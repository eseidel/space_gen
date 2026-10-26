enum AppsListAccountsForPlanDirection {
  asc._('asc'),
  desc._('desc');

  const AppsListAccountsForPlanDirection._(this.value);

  /// Creates a AppsListAccountsForPlanDirection from a json value.
  factory AppsListAccountsForPlanDirection.fromJson(String json) {
    return AppsListAccountsForPlanDirection.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppsListAccountsForPlanDirection value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppsListAccountsForPlanDirection? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppsListAccountsForPlanDirection.fromJson(json);
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
