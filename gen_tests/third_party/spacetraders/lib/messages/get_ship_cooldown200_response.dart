import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/cooldown.dart';

/// {@template get_ship_cooldown200_response}
/// Successfully fetched ship's cooldown.
/// {@endtemplate}
@immutable
class GetShipCooldown200Response {
  /// {@macro get_ship_cooldown200_response}
  const GetShipCooldown200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetShipCooldown200Response].
  factory GetShipCooldown200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetShipCooldown200Response',
      json,
      () => GetShipCooldown200Response(
        data: Cooldown.fromJson(json['data'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetShipCooldown200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetShipCooldown200Response.fromJson(json);
  }

  /// A cooldown is a period of time in which a ship cannot perform certain
  /// actions.
  final Cooldown data;

  /// Converts a [GetShipCooldown200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetShipCooldown200Response && data == other.data;
  }
}
