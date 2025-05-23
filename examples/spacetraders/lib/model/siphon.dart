import 'package:spacetraders/model/siphon_yield.dart';

class Siphon {
  Siphon({required this.shipSymbol, required this.yield_});

  factory Siphon.fromJson(Map<String, dynamic> json) {
    return Siphon(
      shipSymbol: json['shipSymbol'] as String,
      yield_: SiphonYield.fromJson(json['yield'] as Map<String, dynamic>),
    );
  }

  final String shipSymbol;
  final SiphonYield yield_;

  Map<String, dynamic> toJson() {
    return {'shipSymbol': shipSymbol, 'yield_': yield_.toJson()};
  }
}
