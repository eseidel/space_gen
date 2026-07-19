import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/trade_symbol.dart';

@immutable
class JettisonRequest {
  const JettisonRequest({required this.symbol, required this.units});

  /// Converts a `Map<String, dynamic>` to a [JettisonRequest].
  factory JettisonRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'JettisonRequest',
      json,
      () => JettisonRequest(
        symbol: TradeSymbol.fromJson(json['symbol'] as String),
        units: json['units'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static JettisonRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return JettisonRequest.fromJson(json);
  }

  /// The good's symbol.
  final TradeSymbol symbol;

  /// Amount of units to jettison of this good.
  final int units;

  /// Converts a [JettisonRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson(), 'units': units};
  }

  @override
  int get hashCode => Object.hashAll([symbol, units]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JettisonRequest &&
        symbol == other.symbol &&
        units == other.units;
  }
}
