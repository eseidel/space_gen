import 'package:spacetraders/model/contract.dart';
import 'package:spacetraders/model/ship_cargo.dart';

class DeliverContract200Response {
  DeliverContract200Response({
    required this.data,
  });

  factory DeliverContract200Response.fromJson(Map<String, dynamic> json) {
    return DeliverContract200Response(
      data: DeliverContract200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final DeliverContract200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class DeliverContract200ResponseData {
  DeliverContract200ResponseData({
    required this.contract,
    required this.cargo,
  });

  factory DeliverContract200ResponseData.fromJson(Map<String, dynamic> json) {
    return DeliverContract200ResponseData(
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
    );
  }

  final Contract contract;
  final ShipCargo cargo;

  Map<String, dynamic> toJson() {
    return {
      'contract': contract.toJson(),
      'cargo': cargo.toJson(),
    };
  }
}
