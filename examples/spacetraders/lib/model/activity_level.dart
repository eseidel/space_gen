enum ActivityLevel {
  WEAK._('WEAK'),
  GROWING._('GROWING'),
  STRONG._('STRONG'),
  RESTRICTED._('RESTRICTED');

  const ActivityLevel._(this.value);

  factory ActivityLevel.fromJson(String json) {
    return ActivityLevel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ActivityLevel value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
