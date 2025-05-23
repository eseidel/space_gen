import 'package:spacetraders/model/install_mount201_response_data.dart';

class InstallMount201Response {
  InstallMount201Response({required this.data});

  factory InstallMount201Response.fromJson(Map<String, dynamic> json) {
    return InstallMount201Response(
      data: InstallMount201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final InstallMount201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
