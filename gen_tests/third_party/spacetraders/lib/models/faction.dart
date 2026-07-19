import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/faction_symbol.dart';
import 'package:spacetraders/models/faction_trait.dart';

/// {@template faction}
/// Faction details.
/// {@endtemplate}
@immutable
class Faction {
  /// {@macro faction}
  const Faction({
    required this.symbol,
    required this.name,
    required this.description,
    required this.traits,
    required this.isRecruiting,
    this.headquarters,
  });

  /// Converts a `Map<String, dynamic>` to a [Faction].
  factory Faction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Faction',
      json,
      () => Faction(
        symbol: FactionSymbol.fromJson(json['symbol'] as String),
        name: json['name'] as String,
        description: json['description'] as String,
        headquarters: json['headquarters'] as String?,
        traits: (json['traits'] as List)
            .map<FactionTrait>(
              (e) => FactionTrait.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        isRecruiting: json['isRecruiting'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Faction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Faction.fromJson(json);
  }

  /// The symbol of the faction.
  final FactionSymbol symbol;

  /// Name of the faction.
  final String name;

  /// Description of the faction.
  final String description;

  /// The waypoint in which the faction's HQ is located in.
  final String? headquarters;

  /// List of traits that define this faction.
  final List<FactionTrait> traits;

  /// Whether or not the faction is currently recruiting new agents.
  final bool isRecruiting;

  /// Converts a [Faction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      if (headquarters != null) 'headquarters': headquarters,
      'traits': traits.map((e) => e.toJson()).toList(),
      'isRecruiting': isRecruiting,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    symbol,
    name,
    description,
    headquarters,
    listHash(traits),
    isRecruiting,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Faction &&
        symbol == other.symbol &&
        name == other.name &&
        description == other.description &&
        headquarters == other.headquarters &&
        listsEqual(traits, other.traits) &&
        isRecruiting == other.isRecruiting;
  }
}
