import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_nav.dart';

/// {@template get_ship_nav200_response}
/// The current nav status of the ship.
/// {@endtemplate}
@immutable
class GetShipNav200Response {
  /// {@macro get_ship_nav200_response}
  const GetShipNav200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetShipNav200Response].
  factory GetShipNav200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetShipNav200Response',
      json,
      () => GetShipNav200Response(
        data: ShipNav.fromJson(json['data'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetShipNav200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetShipNav200Response.fromJson(json);
  }

  /// The navigation information of the ship.
  final ShipNav data;

  /// Converts a [GetShipNav200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetShipNav200Response && data == other.data;
  }
}
