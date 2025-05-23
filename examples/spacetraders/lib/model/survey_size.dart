enum SurveySize {
  SMALL('SMALL'),
  MODERATE('MODERATE'),
  LARGE('LARGE');

  const SurveySize(this.value);

  factory SurveySize.fromJson(String json) {
    return SurveySize.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown SurveySize value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
