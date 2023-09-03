import 'package:spacetraders/src/model/faction_trait.dart';

class Faction {
  Faction({
    required this.symbol,
    required this.name,
    required this.description,
    required this.headquarters,
    required this.traits,
    required this.isRecruiting,
  });

  factory Faction.fromJson(Map<String, dynamic> json) {
    return Faction(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      headquarters: json['headquarters'] as String,
      traits: (json['traits'] as List<dynamic>)
          .map<FactionTrait>(
            (e) => FactionTrait.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      isRecruiting: json['isRecruiting'] as bool,
    );
  }

  final String symbol;
  final String name;
  final String description;
  final String headquarters;
  final List<FactionTrait> traits;
  final bool isRecruiting;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
      'description': description,
      'headquarters': headquarters,
      'traits': traits.map((e) => e.toJson()).toList(),
      'isRecruiting': isRecruiting,
    };
  }
}
