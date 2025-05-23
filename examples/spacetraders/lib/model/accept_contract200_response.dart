import 'package:spacetraders/model/accept_contract200_response_data.dart';

class AcceptContract200Response {
  AcceptContract200Response({required this.data});

  factory AcceptContract200Response.fromJson(Map<String, dynamic> json) {
    return AcceptContract200Response(
      data: AcceptContract200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final AcceptContract200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
