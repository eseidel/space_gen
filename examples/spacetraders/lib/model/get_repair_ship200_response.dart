import 'package:spacetraders/model/repair_transaction.dart';

class GetRepairShip200Response {
  GetRepairShip200Response({required this.data});

  factory GetRepairShip200Response.fromJson(Map<String, dynamic> json) {
    return GetRepairShip200Response(
      data: GetRepairShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final GetRepairShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class GetRepairShip200ResponseData {
  GetRepairShip200ResponseData({required this.transaction});

  factory GetRepairShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return GetRepairShip200ResponseData(
      transaction: RepairTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final RepairTransaction transaction;

  Map<String, dynamic> toJson() {
    return {'transaction': transaction.toJson()};
  }
}
