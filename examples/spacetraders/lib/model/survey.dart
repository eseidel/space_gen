import 'package:spacetraders/model/survey_deposit.dart';

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
      size: SurveySizeInner.fromJson(json['size'] as String),
    );
  }

  final String signature;
  final String symbol;
  final List<SurveyDeposit> deposits;
  final DateTime expiration;
  final SurveySizeInner size;

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

enum SurveySizeInner {
  small('SMALL'),
  moderate('MODERATE'),
  large('LARGE'),
  ;

  const SurveySizeInner(this.value);

  factory SurveySizeInner.fromJson(String json) {
    switch (json) {
      case 'SMALL':
        return SurveySizeInner.small;
      case 'MODERATE':
        return SurveySizeInner.moderate;
      case 'LARGE':
        return SurveySizeInner.large;
      default:
        throw Exception('Unknown SurveySizeInner value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case SurveySizeInner.small:
        return 'SMALL';
      case SurveySizeInner.moderate:
        return 'MODERATE';
      case SurveySizeInner.large:
        return 'LARGE';
    }
  }
}
