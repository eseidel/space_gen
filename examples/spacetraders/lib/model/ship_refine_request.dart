import 'package:spacetraders/model/ship_refine_request_produce.dart';

class ShipRefineRequest {
  ShipRefineRequest({required this.produce});

  factory ShipRefineRequest.fromJson(Map<String, dynamic> json) {
    return ShipRefineRequest(
      produce: ShipRefineRequestProduce.fromJson(json['produce'] as String),
    );
  }

  final ShipRefineRequestProduce produce;

  Map<String, dynamic> toJson() {
    return {'produce': produce.toJson()};
  }
}
