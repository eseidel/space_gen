import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class RemoveShipModuleRequest {
  RemoveShipModuleRequest({required this.symbol}) {
    symbol.validate(minLength: 1);
  }

  /// Converts a `Map<String, dynamic>` to a [RemoveShipModuleRequest].
  factory RemoveShipModuleRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RemoveShipModuleRequest',
      json,
      () => RemoveShipModuleRequest(symbol: json['symbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RemoveShipModuleRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RemoveShipModuleRequest.fromJson(json);
  }

  /// The symbol of the module to remove.
  final String symbol;

  /// Converts a [RemoveShipModuleRequest] to a `Map<String, dynamic>`.
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
