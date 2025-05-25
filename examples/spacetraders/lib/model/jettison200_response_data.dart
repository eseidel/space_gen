import 'package:meta/meta.dart';
import 'package:spacetraders/model/ship_cargo.dart';

@immutable
class Jettison200ResponseData {
  const Jettison200ResponseData({required this.cargo});

  factory Jettison200ResponseData.fromJson(Map<String, dynamic> json) {
    return Jettison200ResponseData(
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Jettison200ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Jettison200ResponseData.fromJson(json);
  }

  final ShipCargo cargo;

  Map<String, dynamic> toJson() {
    return {'cargo': cargo.toJson()};
  }

  @override
  int get hashCode => cargo.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Jettison200ResponseData && cargo == other.cargo;
  }
}
