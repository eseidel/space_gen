import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/repair_ship200_response_data.dart';

/// {@template repair_ship200_response}
/// Ship repaired successfully.
/// {@endtemplate}
@immutable
class RepairShip200Response {
  /// {@macro repair_ship200_response}
  const RepairShip200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [RepairShip200Response].
  factory RepairShip200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepairShip200Response',
      json,
      () => RepairShip200Response(
        data: RepairShip200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepairShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepairShip200Response.fromJson(json);
  }

  final RepairShip200ResponseData data;

  /// Converts a [RepairShip200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepairShip200Response && data == other.data;
  }
}
