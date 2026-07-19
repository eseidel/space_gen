import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/navigate_ship200_response_data.dart';

/// {@template navigate_ship200_response}
/// The successful transit information including the route details and changes
/// to ship fuel. The route includes the expected time of arrival.
/// {@endtemplate}
@immutable
class NavigateShip200Response {
  /// {@macro navigate_ship200_response}
  const NavigateShip200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [NavigateShip200Response].
  factory NavigateShip200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'NavigateShip200Response',
      json,
      () => NavigateShip200Response(
        data: NavigateShip200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static NavigateShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return NavigateShip200Response.fromJson(json);
  }

  final NavigateShip200ResponseData data;

  /// Converts a [NavigateShip200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NavigateShip200Response && data == other.data;
  }
}
