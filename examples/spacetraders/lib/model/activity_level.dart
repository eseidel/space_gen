enum ActivityLevel {
  WEAK._('WEAK'),
  GROWING._('GROWING'),
  STRONG._('STRONG'),
  RESTRICTED._('RESTRICTED');

  const ActivityLevel._(this.value);

  factory ActivityLevel.fromJson(String json) {
    return ActivityLevel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown ActivityLevel value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActivityLevel? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ActivityLevel.fromJson(json);
  }

  final String value;

  String toJson() => value;

  @override
  String toString() => value;
}
