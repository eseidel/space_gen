import 'package:meta/meta.dart';

@immutable
class RefuelShipRequest {
  const RefuelShipRequest({this.units, this.fromCargo});

  factory RefuelShipRequest.fromJson(Map<String, dynamic> json) {
    return RefuelShipRequest(
      units: json['units'] as int?,
      fromCargo: json['fromCargo'] as bool?,
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
  final bool? fromCargo;

  Map<String, dynamic> toJson() {
    return {'units': units, 'fromCargo': fromCargo};
  }

  @override
  int get hashCode => Object.hash(units, fromCargo);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RefuelShipRequest &&
        units == other.units &&
        fromCargo == other.fromCargo;
  }
}
