import 'package:spacetraders/model/system.dart';

class GetSystem200Response {
  GetSystem200Response({
    required this.data,
  });

  factory GetSystem200Response.fromJson(Map<String, dynamic> json) {
    return GetSystem200Response(
      data: System.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final System data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
