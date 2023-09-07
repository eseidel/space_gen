import 'package:spacetraders/model/market.dart';

class GetMarket200Response {
  GetMarket200Response({
    required this.data,
  });

  factory GetMarket200Response.fromJson(Map<String, dynamic> json) {
    return GetMarket200Response(
      data: Market.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Market data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
