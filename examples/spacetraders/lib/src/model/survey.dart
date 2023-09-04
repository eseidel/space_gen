import 'package:spacetraders/src/model/survey_deposit.dart';

class Survey {
  Survey({
    required this.signature,
    required this.symbol,
    required this.deposits,
    required this.expiration,
    required this.size,
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      signature: json['signature'] as String,
      symbol: json['symbol'] as String,
      deposits: (json['deposits'] as List<dynamic>)
          .map<SurveyDeposit>(
            (e) => SurveyDeposit.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      expiration: DateTime.parse(json['expiration'] as String),
      size: SurveySizeString.fromJson(json['size'] as String),
    );
  }

  final String signature;
  final String symbol;
  final List<SurveyDeposit> deposits;
  final DateTime expiration;
  final SurveySizeString size;

  Map<String, dynamic> toJson() {
    return {
      'signature': signature,
      'symbol': symbol,
      'deposits': deposits.map((e) => e.toJson()).toList(),
      'expiration': expiration.toIso8601String(),
      'size': size.toJson(),
    };
  }
}

enum SurveySizeString {
  small('SMALL'),
  moderate('MODERATE'),
  large('LARGE'),
  ;

  const SurveySizeString(this.value);

  factory SurveySizeString.fromJson(String json) {
    switch (json) {
      case 'SMALL':
        return SurveySizeString.small;
      case 'MODERATE':
        return SurveySizeString.moderate;
      case 'LARGE':
        return SurveySizeString.large;
      default:
        throw Exception('Unknown SurveySizeString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case SurveySizeString.small:
        return 'SMALL';
      case SurveySizeString.moderate:
        return 'MODERATE';
      case SurveySizeString.large:
        return 'LARGE';
    }
  }
}
