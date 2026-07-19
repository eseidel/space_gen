import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/patch_ship_nav200_response_data.dart';

/// {@template patch_ship_nav200_response}
/// Success response for updating the nav configuration of a ship.
/// {@endtemplate}
@immutable
class PatchShipNav200Response {
  /// {@macro patch_ship_nav200_response}
  const PatchShipNav200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [PatchShipNav200Response].
  factory PatchShipNav200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PatchShipNav200Response',
      json,
      () => PatchShipNav200Response(
        data: PatchShipNav200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PatchShipNav200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PatchShipNav200Response.fromJson(json);
  }

  final PatchShipNav200ResponseData data;

  /// Converts a [PatchShipNav200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PatchShipNav200Response && data == other.data;
  }
}
