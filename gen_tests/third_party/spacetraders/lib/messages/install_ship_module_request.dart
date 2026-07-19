import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class InstallShipModuleRequest {
  const InstallShipModuleRequest({required this.symbol});

  /// Converts a `Map<String, dynamic>` to an [InstallShipModuleRequest].
  factory InstallShipModuleRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InstallShipModuleRequest',
      json,
      () => InstallShipModuleRequest(symbol: json['symbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InstallShipModuleRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InstallShipModuleRequest.fromJson(json);
  }

  /// The symbol of the module to install.
  final String symbol;

  /// Converts an [InstallShipModuleRequest] to a `Map<String, dynamic>`.
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
