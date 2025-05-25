import 'package:meta/meta.dart';
import 'package:spacetraders/model/trade_symbol.dart';

@immutable
class SurveyDeposit {
  const SurveyDeposit({required this.symbol});

  factory SurveyDeposit.fromJson(Map<String, dynamic> json) {
    return SurveyDeposit(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
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

  final TradeSymbol symbol;

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
