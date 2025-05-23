import 'package:spacetraders/model/extract_resources201_response_data.dart';

class ExtractResources201Response {
  ExtractResources201Response({required this.data});

  factory ExtractResources201Response.fromJson(Map<String, dynamic> json) {
    return ExtractResources201Response(
      data: ExtractResources201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final ExtractResources201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
