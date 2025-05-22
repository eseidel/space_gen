import 'package:spacetraders/model/scrap_transaction.dart';

class GetScrapShip200Response {
  GetScrapShip200Response({required this.data});

  factory GetScrapShip200Response.fromJson(Map<String, dynamic> json) {
    return GetScrapShip200Response(
      data: GetScrapShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final GetScrapShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class GetScrapShip200ResponseData {
  GetScrapShip200ResponseData({required this.transaction});

  factory GetScrapShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return GetScrapShip200ResponseData(
      transaction: ScrapTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final ScrapTransaction transaction;

  Map<String, dynamic> toJson() {
    return {'transaction': transaction.toJson()};
  }
}
