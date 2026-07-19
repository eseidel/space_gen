enum DependabotAlertScopeParam {
  development._('development'),
  runtime._('runtime');

  const DependabotAlertScopeParam._(this.value);

  /// Creates a DependabotAlertScopeParam from a json value.
  factory DependabotAlertScopeParam.fromJson(String json) {
    return DependabotAlertScopeParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DependabotAlertScopeParam value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependabotAlertScopeParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DependabotAlertScopeParam.fromJson(json);
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
