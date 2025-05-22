import 'package:spacetraders/model/construction_material.dart';

class Construction {
  Construction({
    required this.symbol,
    required this.materials,
    required this.isComplete,
  });

  factory Construction.fromJson(Map<String, dynamic> json) {
    return Construction(
      symbol: json['symbol'] as String,
      materials:
          (json['materials'] as List<dynamic>)
              .map<ConstructionMaterial>(
                (e) => ConstructionMaterial.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      isComplete: json['isComplete'] as bool,
    );
  }

  final String symbol;
  final List<ConstructionMaterial> materials;
  final bool isComplete;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'materials': materials.map((e) => e.toJson()).toList(),
      'isComplete': isComplete,
    };
  }
}
