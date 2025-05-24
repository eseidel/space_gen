import 'package:spacetraders/model/siphon_yield.dart';

class Siphon {
  Siphon({required this.shipSymbol, required this.yield_});

  factory Siphon.fromJson(Map<String, dynamic> json) {
    return Siphon(
      shipSymbol: json['shipSymbol'] as String,
      yield_: SiphonYield.fromJson(json['yield'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Siphon? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Siphon.fromJson(json);
  }

  final String shipSymbol;
  final SiphonYield yield_;

  Map<String, dynamic> toJson() {
    return {'shipSymbol': shipSymbol, 'yield_': yield_.toJson()};
  }
}
