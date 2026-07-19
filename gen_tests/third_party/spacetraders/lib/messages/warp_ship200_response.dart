import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/warp_ship200_response_data.dart';

/// {@template warp_ship200_response}
/// The successful transit information including the route details and changes
/// to ship fuel. The route includes the expected time of arrival.
/// {@endtemplate}
@immutable
class WarpShip200Response {
  /// {@macro warp_ship200_response}
  const WarpShip200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [WarpShip200Response].
  factory WarpShip200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WarpShip200Response',
      json,
      () => WarpShip200Response(
        data: WarpShip200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WarpShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WarpShip200Response.fromJson(json);
  }

  final WarpShip200ResponseData data;

  /// Converts a [WarpShip200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WarpShip200Response && data == other.data;
  }
}
