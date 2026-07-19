import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/extraction_yield.dart';

/// {@template extraction}
/// Extraction details.
/// {@endtemplate}
@immutable
class Extraction {
  /// {@macro extraction}
  const Extraction({required this.shipSymbol, required this.yield_});

  /// Converts a `Map<String, dynamic>` to an [Extraction].
  factory Extraction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Extraction',
      json,
      () => Extraction(
        shipSymbol: json['shipSymbol'] as String,
        yield_: ExtractionYield.fromJson(json['yield'] as Map<String, dynamic>),
      ),
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

  /// Symbol of the ship that executed the extraction.
  final String shipSymbol;

  /// A yield from the extraction operation.
  final ExtractionYield yield_;

  /// Converts an [Extraction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'shipSymbol': shipSymbol, 'yield': yield_.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([shipSymbol, yield_]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Extraction &&
        shipSymbol == other.shipSymbol &&
        yield_ == other.yield_;
  }
}
