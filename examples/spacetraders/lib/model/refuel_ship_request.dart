class RefuelShipRequest {
  RefuelShipRequest({this.units, this.fromCargo = false});

  factory RefuelShipRequest.fromJson(Map<String, dynamic> json) {
    return RefuelShipRequest(
      units: json['units'] as int,
      fromCargo: json['fromCargo'],
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RefuelShipRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RefuelShipRequest.fromJson(json);
  }

  final int? units;
  final dynamic fromCargo;

  Map<String, dynamic> toJson() {
    return {'units': units, 'fromCargo': fromCargo};
  }
}
