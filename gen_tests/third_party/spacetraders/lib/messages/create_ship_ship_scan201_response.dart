import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/create_ship_ship_scan201_response_data.dart';

/// {@template create_ship_ship_scan201_response}
/// Successfully scanned for nearby ships.
/// {@endtemplate}
@immutable
class CreateShipShipScan201Response {
  /// {@macro create_ship_ship_scan201_response}
  const CreateShipShipScan201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [CreateShipShipScan201Response].
  factory CreateShipShipScan201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateShipShipScan201Response',
      json,
      () => CreateShipShipScan201Response(
        data: CreateShipShipScan201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateShipShipScan201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateShipShipScan201Response.fromJson(json);
  }

  final CreateShipShipScan201ResponseData data;

  /// Converts a [CreateShipShipScan201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateShipShipScan201Response && data == other.data;
  }
}
