import 'package:spacetraders/model/siphon_yield.dart';

class Siphon {
  Siphon({
    required this.shipSymbol,
    required this.yield,
  });

  factory Siphon.fromJson(Map<String, dynamic> json) {
    return Siphon(
      shipSymbol: json['shipSymbol'] as String,
      yield: SiphonYield.fromJson(json['yield'] as Map<String, dynamic>),
    );
  }

  final String shipSymbol;
  final SiphonYield yield;

  Map<String, dynamic> toJson() {
    return {
      'shipSymbol': shipSymbol,
      'yield': yield.toJson(),
    };
  }
}
