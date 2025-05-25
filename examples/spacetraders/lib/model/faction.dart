import 'package:spacetraders/model/faction_symbol.dart';
import 'package:spacetraders/model/faction_trait.dart';

class Faction {
  Faction({
    required this.symbol,
    required this.name,
    required this.description,
    required this.traits,
    required this.isRecruiting,
    this.headquarters,
  });

  factory Faction.fromJson(Map<String, dynamic> json) {
    return Faction(
      symbol: FactionSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      headquarters: json['headquarters'] as String,
      traits:
          (json['traits'] as List<dynamic>)
              .map<FactionTrait>(
                (e) => FactionTrait.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      isRecruiting: json['isRecruiting'] as bool,
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

  final FactionSymbol symbol;
  final String name;
  final String description;
  final String? headquarters;
  final List<FactionTrait> traits;
  final bool isRecruiting;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      'headquarters': headquarters,
      'traits': traits.map((e) => e.toJson()).toList(),
      'isRecruiting': isRecruiting,
    };
  }
}
