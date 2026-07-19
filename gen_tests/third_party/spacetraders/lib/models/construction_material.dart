import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/trade_symbol.dart';

/// {@template construction_material}
/// The details of the required construction materials for a given waypoint
/// under construction.
/// {@endtemplate}
@immutable
class ConstructionMaterial {
  /// {@macro construction_material}
  const ConstructionMaterial({
    required this.tradeSymbol,
    required this.required_,
    required this.fulfilled,
  });

  /// Converts a `Map<String, dynamic>` to a [ConstructionMaterial].
  factory ConstructionMaterial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ConstructionMaterial',
      json,
      () => ConstructionMaterial(
        tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
        required_: json['required'] as int,
        fulfilled: json['fulfilled'] as int,
      ),
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

  /// The good's symbol.
  final TradeSymbol tradeSymbol;

  /// The number of units required.
  final int required_;

  /// The number of units fulfilled toward the required amount.
  final int fulfilled;

  /// Converts a [ConstructionMaterial] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol.toJson(),
      'required': required_,
      'fulfilled': fulfilled,
    };
  }

  @override
  int get hashCode => Object.hashAll([tradeSymbol, required_, fulfilled]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ConstructionMaterial &&
        tradeSymbol == other.tradeSymbol &&
        required_ == other.required_ &&
        fulfilled == other.fulfilled;
  }
}
