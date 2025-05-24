import 'package:spacetraders/model/install_ship_module201_response_data.dart';

class InstallShipModule201Response {
  InstallShipModule201Response({required this.data});

  factory InstallShipModule201Response.fromJson(Map<String, dynamic> json) {
    return InstallShipModule201Response(
      data: InstallShipModule201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InstallShipModule201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return InstallShipModule201Response.fromJson(json);
  }

  final InstallShipModule201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
