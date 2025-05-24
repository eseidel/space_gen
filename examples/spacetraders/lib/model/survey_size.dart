enum SurveySize {
  SMALL._('SMALL'),
  MODERATE._('MODERATE'),
  LARGE._('LARGE');

  const SurveySize._(this.value);

  factory SurveySize.fromJson(String json) {
    return SurveySize.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown SurveySize value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
