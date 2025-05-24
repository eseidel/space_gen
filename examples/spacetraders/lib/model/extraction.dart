import 'package:spacetraders/model/extraction_yield.dart';

class Extraction {
  Extraction({required this.shipSymbol, required this.yield_});

  factory Extraction.fromJson(Map<String, dynamic> json) {
    return Extraction(
      shipSymbol: json['shipSymbol'] as String,
      yield_: ExtractionYield.fromJson(json['yield'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Extraction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Extraction.fromJson(json);
  }

  final String shipSymbol;
  final ExtractionYield yield_;

  Map<String, dynamic> toJson() {
    return {'shipSymbol': shipSymbol, 'yield_': yield_.toJson()};
  }
}
