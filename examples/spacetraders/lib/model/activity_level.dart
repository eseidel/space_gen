enum ActivityLevel {
  weak('WEAK'),
  growing('GROWING'),
  strong('STRONG'),
  restricted('RESTRICTED');

  const ActivityLevel(this.value);

  factory ActivityLevel.fromJson(String json) {
    return ActivityLevel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ActivityLevel value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
