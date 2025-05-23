import 'package:spacetraders/model/negotiate_contract201_response_data.dart';

class NegotiateContract201Response {
  NegotiateContract201Response({required this.data});

  factory NegotiateContract201Response.fromJson(Map<String, dynamic> json) {
    return NegotiateContract201Response(
      data: NegotiateContract201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final NegotiateContract201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
