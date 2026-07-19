import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class RefuelShipRequest {
  const RefuelShipRequest({this.units, this.fromCargo});

  /// Converts a `Map<String, dynamic>` to a [RefuelShipRequest].
  factory RefuelShipRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RefuelShipRequest',
      json,
      () => RefuelShipRequest(
        units: json['units'] as int?,
        fromCargo: json['fromCargo'] as bool?,
      ),
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

  /// The amount of fuel to fill in the ship's tanks. When not specified, the
  /// ship will be refueled to its maximum fuel capacity. If the amount
  /// specified is greater than the ship's remaining capacity, the ship will
  /// only be refueled to its maximum fuel capacity. The amount specified is
  /// not in market units but in ship fuel units.
  /// Example: `100`
  final int? units;
  final bool? fromCargo;

  /// Converts a [RefuelShipRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'units': ?units, 'fromCargo': fromCargo};
  }

  @override
  int get hashCode => Object.hashAll([units, fromCargo]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RefuelShipRequest &&
        units == other.units &&
        fromCargo == other.fromCargo;
  }
}
