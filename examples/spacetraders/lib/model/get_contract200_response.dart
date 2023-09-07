import 'package:spacetraders/model/contract.dart';

class GetContract200Response {
  GetContract200Response({
    required this.data,
  });

  factory GetContract200Response.fromJson(Map<String, dynamic> json) {
    return GetContract200Response(
      data: Contract.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Contract data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
