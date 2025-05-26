import 'package:meta/meta.dart';
import 'package:spacetraders/model/ship_module_symbol.dart';
import 'package:spacetraders/model/ship_requirements.dart';

@immutable
class ShipModule {
  const ShipModule({
    required this.symbol,
    required this.name,
    required this.description,
    required this.requirements,
    this.capacity,
    this.range,
  });

  factory ShipModule.fromJson(Map<String, dynamic> json) {
    return ShipModule(
      symbol: ShipModuleSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      capacity: json['capacity'] as int?,
      range: json['range'] as int?,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipModule? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipModule.fromJson(json);
  }

  final ShipModuleSymbol symbol;
  final String name;
  final String description;
  final int? capacity;
  final int? range;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      'capacity': capacity,
      'range': range,
      'requirements': requirements.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hash(symbol, name, description, capacity, range, requirements);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipModule &&
        symbol == other.symbol &&
        name == other.name &&
        description == other.description &&
        capacity == other.capacity &&
        range == other.range &&
        requirements == other.requirements;
  }
}
