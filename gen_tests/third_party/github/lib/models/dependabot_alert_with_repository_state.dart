/// The state of the Dependabot alert.
enum DependabotAlertWithRepositoryState {
  autoDismissed._('auto_dismissed'),
  dismissed._('dismissed'),
  fixed._('fixed'),
  open._('open');

  const DependabotAlertWithRepositoryState._(this.value);

  /// Creates a DependabotAlertWithRepositoryState from a json value.
  factory DependabotAlertWithRepositoryState.fromJson(String json) {
    return DependabotAlertWithRepositoryState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DependabotAlertWithRepositoryState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependabotAlertWithRepositoryState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DependabotAlertWithRepositoryState.fromJson(json);
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
