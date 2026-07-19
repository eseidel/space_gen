import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship.dart';

/// {@template get_my_ship200_response}
/// Successfully fetched ship.
/// {@endtemplate}
@immutable
class GetMyShip200Response {
  /// {@macro get_my_ship200_response}
  const GetMyShip200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetMyShip200Response].
  factory GetMyShip200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetMyShip200Response',
      json,
      () => GetMyShip200Response(
        data: Ship.fromJson(json['data'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetMyShip200Response.fromJson(json);
  }

  /// Ship details.
  final Ship data;

  /// Converts a [GetMyShip200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMyShip200Response && data == other.data;
  }
}
