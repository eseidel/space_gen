import 'package:spacetraders/model/remove_mount201_response_data.dart';

class RemoveMount201Response {
  RemoveMount201Response({required this.data});

  factory RemoveMount201Response.fromJson(Map<String, dynamic> json) {
    return RemoveMount201Response(
      data: RemoveMount201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final RemoveMount201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
