import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_cargo.dart';

/// {@template get_my_ship_cargo200_response}
/// Successfully fetched ship's cargo.
/// {@endtemplate}
@immutable
class GetMyShipCargo200Response {
  /// {@macro get_my_ship_cargo200_response}
  const GetMyShipCargo200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetMyShipCargo200Response].
  factory GetMyShipCargo200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetMyShipCargo200Response',
      json,
      () => GetMyShipCargo200Response(
        data: ShipCargo.fromJson(json['data'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyShipCargo200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetMyShipCargo200Response.fromJson(json);
  }

  /// Ship cargo details.
  final ShipCargo data;

  /// Converts a [GetMyShipCargo200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMyShipCargo200Response && data == other.data;
  }
}
