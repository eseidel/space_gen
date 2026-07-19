import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/get_scrap_ship200_response_data.dart';

/// {@template get_scrap_ship200_response}
/// Successfully retrieved the amount of value that will be returned when
/// scrapping a ship.
/// {@endtemplate}
@immutable
class GetScrapShip200Response {
  /// {@macro get_scrap_ship200_response}
  const GetScrapShip200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetScrapShip200Response].
  factory GetScrapShip200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetScrapShip200Response',
      json,
      () => GetScrapShip200Response(
        data: GetScrapShip200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetScrapShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetScrapShip200Response.fromJson(json);
  }

  final GetScrapShip200ResponseData data;

  /// Converts a [GetScrapShip200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetScrapShip200Response && data == other.data;
  }
}
