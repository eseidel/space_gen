import 'package:spacetraders/model/meta.dart';

class GetMyFactions200Response {
  GetMyFactions200Response({required this.data, required this.meta});

  factory GetMyFactions200Response.fromJson(Map<String, dynamic> json) {
    return GetMyFactions200Response(
      data:
          (json['data'] as List<dynamic>)
              .map<GetMyFactions200ResponseData>(
                (e) => GetMyFactions200ResponseData.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  final List<GetMyFactions200ResponseData> data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}

class GetMyFactions200ResponseData {
  GetMyFactions200ResponseData({
    required this.symbol,
    required this.reputation,
  });

  factory GetMyFactions200ResponseData.fromJson(Map<String, dynamic> json) {
    return GetMyFactions200ResponseData(
      symbol: json['symbol'] as String,
      reputation: json['reputation'] as int,
    );
  }

  final String symbol;
  final int reputation;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol, 'reputation': reputation};
  }
}
