import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/trade_symbol.dart';

/// {@template survey_deposit}
/// A surveyed deposit of a mineral or resource available for extraction.
/// {@endtemplate}
@immutable
class SurveyDeposit {
  /// {@macro survey_deposit}
  const SurveyDeposit({required this.symbol});

  /// Converts a `Map<String, dynamic>` to a [SurveyDeposit].
  factory SurveyDeposit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SurveyDeposit',
      json,
      () =>
          SurveyDeposit(symbol: TradeSymbol.fromJson(json['symbol'] as String)),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SurveyDeposit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SurveyDeposit.fromJson(json);
  }

  /// The good's symbol.
  final TradeSymbol symbol;

  /// Converts a [SurveyDeposit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson()};
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SurveyDeposit && symbol == other.symbol;
  }
}
