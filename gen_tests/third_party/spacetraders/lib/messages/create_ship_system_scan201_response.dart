import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/create_ship_system_scan201_response_data.dart';

/// {@template create_ship_system_scan201_response}
/// Successfully scanned for nearby systems.
/// {@endtemplate}
@immutable
class CreateShipSystemScan201Response {
  /// {@macro create_ship_system_scan201_response}
  const CreateShipSystemScan201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [CreateShipSystemScan201Response].
  factory CreateShipSystemScan201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateShipSystemScan201Response',
      json,
      () => CreateShipSystemScan201Response(
        data: CreateShipSystemScan201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateShipSystemScan201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateShipSystemScan201Response.fromJson(json);
  }

  final CreateShipSystemScan201ResponseData data;

  /// Converts a [CreateShipSystemScan201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateShipSystemScan201Response && data == other.data;
  }
}
