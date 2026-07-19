import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/get_repair_ship200_response_data.dart';

/// {@template get_repair_ship200_response}
/// Successfully retrieved the cost of repairing a ship.
/// {@endtemplate}
@immutable
class GetRepairShip200Response {
  /// {@macro get_repair_ship200_response}
  const GetRepairShip200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetRepairShip200Response].
  factory GetRepairShip200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetRepairShip200Response',
      json,
      () => GetRepairShip200Response(
        data: GetRepairShip200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetRepairShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetRepairShip200Response.fromJson(json);
  }

  final GetRepairShip200ResponseData data;

  /// Converts a [GetRepairShip200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetRepairShip200Response && data == other.data;
  }
}
