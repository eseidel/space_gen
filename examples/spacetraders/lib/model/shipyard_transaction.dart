import 'package:meta/meta.dart';

@immutable
class ShipyardTransaction {
  const ShipyardTransaction({
    required this.waypointSymbol,
    required this.shipSymbol,
    required this.shipType,
    required this.price,
    required this.agentSymbol,
    required this.timestamp,
  });

  factory ShipyardTransaction.fromJson(Map<String, dynamic> json) {
    return ShipyardTransaction(
      waypointSymbol: json['waypointSymbol'] as String,
      shipSymbol: json['shipSymbol'] as String,
      shipType: json['shipType'] as String,
      price: json['price'] as int,
      agentSymbol: json['agentSymbol'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipyardTransaction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipyardTransaction.fromJson(json);
  }

  final String waypointSymbol;
  final String shipSymbol;
  final String shipType;
  final int price;
  final String agentSymbol;
  final DateTime timestamp;

  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol,
      'shipSymbol': shipSymbol,
      'shipType': shipType,
      'price': price,
      'agentSymbol': agentSymbol,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hash(
    waypointSymbol,
    shipSymbol,
    shipType,
    price,
    agentSymbol,
    timestamp,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipyardTransaction &&
        waypointSymbol == other.waypointSymbol &&
        shipSymbol == other.shipSymbol &&
        shipType == other.shipType &&
        price == other.price &&
        agentSymbol == other.agentSymbol &&
        timestamp == other.timestamp;
  }
}
