import 'package:meta/meta.dart';

@immutable
class RemoveShipModuleRequest {
  const RemoveShipModuleRequest({required this.symbol});

  factory RemoveShipModuleRequest.fromJson(Map<String, dynamic> json) {
    return RemoveShipModuleRequest(symbol: json['symbol'] as String);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RemoveShipModuleRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RemoveShipModuleRequest.fromJson(json);
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
    return other is RemoveShipModuleRequest && symbol == other.symbol;
  }
}
