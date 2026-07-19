/// Example: `'ahead'`
enum CommitComparisonStatus {
  diverged._('diverged'),
  ahead._('ahead'),
  behind._('behind'),
  identical._('identical');

  const CommitComparisonStatus._(this.value);

  /// Creates a CommitComparisonStatus from a json value.
  factory CommitComparisonStatus.fromJson(String json) {
    return CommitComparisonStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown CommitComparisonStatus value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CommitComparisonStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CommitComparisonStatus.fromJson(json);
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
