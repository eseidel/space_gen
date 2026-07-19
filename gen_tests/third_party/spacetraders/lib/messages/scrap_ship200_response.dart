import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/scrap_ship200_response_data.dart';

/// {@template scrap_ship200_response}
/// Ship scrapped successfully.
/// {@endtemplate}
@immutable
class ScrapShip200Response {
  /// {@macro scrap_ship200_response}
  const ScrapShip200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [ScrapShip200Response].
  factory ScrapShip200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ScrapShip200Response',
      json,
      () => ScrapShip200Response(
        data: ScrapShip200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScrapShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScrapShip200Response.fromJson(json);
  }

  final ScrapShip200ResponseData data;

  /// Converts a [ScrapShip200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScrapShip200Response && data == other.data;
  }
}
