import 'package:meta/meta.dart';
import 'package:spacetraders/model/create_ship_ship_scan201_response_data.dart';

@immutable
class CreateShipShipScan201Response {
  const CreateShipShipScan201Response({required this.data});

  factory CreateShipShipScan201Response.fromJson(Map<String, dynamic> json) {
    return CreateShipShipScan201Response(
      data: CreateShipShipScan201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
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
