import 'package:meta/meta.dart';

@immutable
class ScannedShipMountsInner {
  const ScannedShipMountsInner({required this.symbol});

  factory ScannedShipMountsInner.fromJson(Map<String, dynamic> json) {
    return ScannedShipMountsInner(symbol: json['symbol'] as String);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScannedShipMountsInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScannedShipMountsInner.fromJson(json);
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScannedShipMountsInner && symbol == other.symbol;
  }
}
