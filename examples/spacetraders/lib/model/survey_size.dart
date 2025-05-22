enum SurveySize {
  small('SMALL'),
  moderate('MODERATE'),
  large('LARGE');

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
