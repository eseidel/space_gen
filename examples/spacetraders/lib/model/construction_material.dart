import 'package:meta/meta.dart';
import 'package:spacetraders/model/trade_symbol.dart';

@immutable
class ConstructionMaterial {
  const ConstructionMaterial({
    required this.tradeSymbol,
    required this.required_,
    required this.fulfilled,
  });

  factory ConstructionMaterial.fromJson(Map<String, dynamic> json) {
    return ConstructionMaterial(
      tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
      required_: json['required'] as int,
      fulfilled: json['fulfilled'] as int,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ConstructionMaterial? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ConstructionMaterial.fromJson(json);
  }

  final TradeSymbol tradeSymbol;
  final int required_;
  final int fulfilled;

  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol.toJson(),
      'required': required_,
      'fulfilled': fulfilled,
    };
  }

  @override
  int get hashCode => Object.hash(tradeSymbol, required_, fulfilled);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ConstructionMaterial &&
        tradeSymbol == other.tradeSymbol &&
        required_ == other.required_ &&
        fulfilled == other.fulfilled;
  }
}
