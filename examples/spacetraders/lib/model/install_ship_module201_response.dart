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

  final InstallShipModule201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
