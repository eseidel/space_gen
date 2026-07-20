import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/siphon_yield.dart';

/// {@template siphon}
/// Siphon details.
/// {@endtemplate}
@immutable
class Siphon {
  /// {@macro siphon}
  Siphon({required this.shipSymbol, required this.yield_}) {
    shipSymbol.validate(minLength: 1);
  }

  /// Converts a `Map<String, dynamic>` to a [Siphon].
  factory Siphon.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Siphon',
      json,
      () => Siphon(
        shipSymbol: json['shipSymbol'] as String,
        yield_: SiphonYield.fromJson(json['yield'] as Map<String, dynamic>),
      ),
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

  /// Symbol of the ship that executed the siphon.
  final String shipSymbol;

  /// A yield from the siphon operation.
  final SiphonYield yield_;

  /// Converts a [Siphon] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'shipSymbol': shipSymbol, 'yield': yield_.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([shipSymbol, yield_]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Siphon &&
        shipSymbol == other.shipSymbol &&
        yield_ == other.yield_;
  }
}
