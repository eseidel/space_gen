import 'package:spacetraders/model/siphon_resources201_response_data.dart';

class SiphonResources201Response {
  SiphonResources201Response({required this.data});

  factory SiphonResources201Response.fromJson(Map<String, dynamic> json) {
    return SiphonResources201Response(
      data: SiphonResources201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final SiphonResources201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
