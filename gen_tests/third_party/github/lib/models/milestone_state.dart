/// The state of the milestone.
/// Example: `'open'`
enum MilestoneState {
  open._('open'),
  closed._('closed');

  const MilestoneState._(this.value);

  /// Creates a MilestoneState from a json value.
  factory MilestoneState.fromJson(String json) {
    return MilestoneState.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown MilestoneState value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MilestoneState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MilestoneState.fromJson(json);
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
