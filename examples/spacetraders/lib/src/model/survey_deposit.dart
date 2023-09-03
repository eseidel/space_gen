class SurveyDeposit {
  SurveyDeposit({
    required this.symbol,
  });

  factory SurveyDeposit.fromJson(Map<String, dynamic> json) {
    return SurveyDeposit(
      symbol: json['symbol'] as String,
    );
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
    };
  }
}
