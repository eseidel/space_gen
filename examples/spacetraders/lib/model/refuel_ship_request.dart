class RefuelShipRequest {
  RefuelShipRequest({
    required this.units,
  });

  factory RefuelShipRequest.fromJson(Map<String, dynamic> json) {
    return RefuelShipRequest(
      units: json['units'] as int,
    );
  }

  final int units;

  Map<String, dynamic> toJson() {
    return {
      'units': units,
    };
  }
}
