import 'package:meta/meta.dart';
import 'package:spacetraders/model/survey_deposit.dart';
import 'package:spacetraders/model/survey_size.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class Survey {
  const Survey({
    required this.signature,
    required this.symbol,
    required this.expiration,
    required this.size,
    this.deposits = const [],
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      signature: json['signature'] as String,
      symbol: json['symbol'] as String,
      deposits:
          (json['deposits'] as List)
              .map<SurveyDeposit>(
                (e) => SurveyDeposit.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      expiration: DateTime.parse(json['expiration'] as String),
      size: SurveySize.fromJson(json['size'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Survey? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Survey.fromJson(json);
  }

  final String signature;
  final String symbol;
  final List<SurveyDeposit> deposits;
  final DateTime expiration;
  final SurveySize size;

  Map<String, dynamic> toJson() {
    return {
      'signature': signature,
      'symbol': symbol,
      'deposits': deposits.map((e) => e.toJson()).toList(),
      'expiration': expiration.toIso8601String(),
      'size': size.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hash(signature, symbol, deposits, expiration, size);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Survey &&
        signature == other.signature &&
        symbol == other.symbol &&
        listsEqual(deposits, other.deposits) &&
        expiration == other.expiration &&
        size == other.size;
  }
}
