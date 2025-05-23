import 'package:spacetraders/model/register201_response_data.dart';

class Register201Response {
  Register201Response({required this.data});

  factory Register201Response.fromJson(Map<String, dynamic> json) {
    return Register201Response(
      data: Register201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final Register201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
