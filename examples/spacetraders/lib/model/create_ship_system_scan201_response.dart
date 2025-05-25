import 'package:meta/meta.dart';
import 'package:spacetraders/model/create_ship_system_scan201_response_data.dart';

@immutable
class CreateShipSystemScan201Response {
  const CreateShipSystemScan201Response({required this.data});

  factory CreateShipSystemScan201Response.fromJson(Map<String, dynamic> json) {
    return CreateShipSystemScan201Response(
      data: CreateShipSystemScan201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
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
