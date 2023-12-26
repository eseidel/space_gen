class RefuelShipRequest {
  RefuelShipRequest({
    required this.units,
    required this.fromCargo,
  });

  factory RefuelShipRequest.fromJson(Map<String, dynamic> json) {
    return RefuelShipRequest(
      units: json['units'] as int,
      fromCargo: json['fromCargo'] as bool,
    );
  }

  final int units;
  final bool fromCargo;

  Map<String, dynamic> toJson() {
    return {
      'units': units,
      'fromCargo': fromCargo,
    };
  }
}
