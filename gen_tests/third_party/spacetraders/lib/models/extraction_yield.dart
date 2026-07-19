import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/trade_symbol.dart';

/// {@template extraction_yield}
/// A yield from the extraction operation.
/// {@endtemplate}
@immutable
class ExtractionYield {
  /// {@macro extraction_yield}
  const ExtractionYield({required this.symbol, required this.units});

  /// Converts a `Map<String, dynamic>` to an [ExtractionYield].
  factory ExtractionYield.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ExtractionYield',
      json,
      () => ExtractionYield(
        symbol: TradeSymbol.fromJson(json['symbol'] as String),
        units: json['units'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ExtractionYield? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ExtractionYield.fromJson(json);
  }

  /// The good's symbol.
  final TradeSymbol symbol;

  /// The number of units extracted that were placed into the ship's cargo
  /// hold.
  final int units;

  /// Converts an [ExtractionYield] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson(), 'units': units};
  }

  @override
  int get hashCode => Object.hashAll([symbol, units]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExtractionYield &&
        symbol == other.symbol &&
        units == other.units;
  }
}
