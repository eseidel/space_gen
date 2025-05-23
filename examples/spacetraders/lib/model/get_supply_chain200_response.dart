import 'package:spacetraders/model/get_supply_chain200_response_data.dart';

class GetSupplyChain200Response {
  GetSupplyChain200Response({required this.data});

  factory GetSupplyChain200Response.fromJson(Map<String, dynamic> json) {
    return GetSupplyChain200Response(
      data: GetSupplyChain200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final GetSupplyChain200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
