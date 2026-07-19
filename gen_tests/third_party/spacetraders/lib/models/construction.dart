import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/construction_material.dart';

/// {@template construction}
/// The construction details of a waypoint.
/// {@endtemplate}
@immutable
class Construction {
  /// {@macro construction}
  const Construction({
    required this.symbol,
    required this.materials,
    required this.isComplete,
  });

  /// Converts a `Map<String, dynamic>` to a [Construction].
  factory Construction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Construction',
      json,
      () => Construction(
        symbol: json['symbol'] as String,
        materials: (json['materials'] as List)
            .map<ConstructionMaterial>(
              (e) => ConstructionMaterial.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        isComplete: json['isComplete'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Construction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Construction.fromJson(json);
  }

  /// The symbol of the waypoint.
  final String symbol;

  /// The materials required to construct the waypoint.
  final List<ConstructionMaterial> materials;

  /// Whether the waypoint has been constructed.
  final bool isComplete;

  /// Converts a [Construction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'materials': materials.map((e) => e.toJson()).toList(),
      'isComplete': isComplete,
    };
  }

  @override
  int get hashCode => Object.hashAll([symbol, listHash(materials), isComplete]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Construction &&
        symbol == other.symbol &&
        listsEqual(materials, other.materials) &&
        isComplete == other.isComplete;
  }
}
