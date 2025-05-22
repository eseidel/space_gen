import 'package:spacetraders/model/scrap_transaction.dart';

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
