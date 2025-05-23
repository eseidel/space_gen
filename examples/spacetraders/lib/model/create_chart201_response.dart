import 'package:spacetraders/model/create_chart201_response_data.dart';

class CreateChart201Response {
  CreateChart201Response({required this.data});

  factory CreateChart201Response.fromJson(Map<String, dynamic> json) {
    return CreateChart201Response(
      data: CreateChart201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateChart201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
