import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/refuel_ship200_response_data.dart';

/// {@template refuel_ship200_response}
/// Refueled successfully.
/// {@endtemplate}
@immutable
class RefuelShip200Response {
  /// {@macro refuel_ship200_response}
  const RefuelShip200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [RefuelShip200Response].
  factory RefuelShip200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RefuelShip200Response',
      json,
      () => RefuelShip200Response(
        data: RefuelShip200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RefuelShip200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RefuelShip200Response.fromJson(json);
  }

  final RefuelShip200ResponseData data;

  /// Converts a [RefuelShip200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RefuelShip200Response && data == other.data;
  }
}
