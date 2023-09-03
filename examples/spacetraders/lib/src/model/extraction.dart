import 'package:spacetraders/src/model/extraction_yield.dart';

class Extraction {
  Extraction({
    required this.shipSymbol,
    required this.yield,
  });

  factory Extraction.fromJson(Map<String, dynamic> json) {
    return Extraction(
      shipSymbol: json['shipSymbol'] as String,
      yield: ExtractionYield.fromJson(json['yield'] as Map<String, dynamic>),
    );
  }

  final String shipSymbol;
  final ExtractionYield yield;

  Map<String, dynamic> toJson() {
    return {
      'shipSymbol': shipSymbol,
      'yield': yield.toJson(),
    };
  }
}
