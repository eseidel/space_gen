import 'package:spacetraders/model/construction.dart';

class GetConstruction200Response {
  GetConstruction200Response({required this.data});

  factory GetConstruction200Response.fromJson(Map<String, dynamic> json) {
    return GetConstruction200Response(
      data: Construction.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Construction data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
