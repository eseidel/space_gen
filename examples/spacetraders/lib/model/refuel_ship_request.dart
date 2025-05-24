class RefuelShipRequest {
  RefuelShipRequest({required this.units, this.fromCargo = false});

  factory RefuelShipRequest.fromJson(Map<String, dynamic> json) {
    return RefuelShipRequest(
      units: json['units'] as int,
      fromCargo: json['fromCargo'],
    );
  }

  final int units;
  final dynamic fromCargo;

  Map<String, dynamic> toJson() {
    return {'units': units, 'fromCargo': fromCargo};
  }
}
