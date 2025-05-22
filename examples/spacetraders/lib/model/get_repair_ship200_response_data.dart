import 'package:spacetraders/model/repair_transaction.dart';

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
