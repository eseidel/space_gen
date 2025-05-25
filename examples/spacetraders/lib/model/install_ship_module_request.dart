import 'package:meta/meta.dart';

@immutable
class InstallShipModuleRequest {
  const InstallShipModuleRequest({required this.symbol});

  factory InstallShipModuleRequest.fromJson(Map<String, dynamic> json) {
    return InstallShipModuleRequest(symbol: json['symbol'] as String);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InstallShipModuleRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InstallShipModuleRequest.fromJson(json);
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
    return other is InstallShipModuleRequest && symbol == other.symbol;
  }
}
