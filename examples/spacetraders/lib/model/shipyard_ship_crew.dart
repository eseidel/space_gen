import 'package:meta/meta.dart';

@immutable
class ShipyardShipCrew {
  const ShipyardShipCrew({required this.required_, required this.capacity});

  factory ShipyardShipCrew.fromJson(Map<String, dynamic> json) {
    return ShipyardShipCrew(
      required_: json['required'] as int,
      capacity: json['capacity'] as int,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipyardShipCrew? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipyardShipCrew.fromJson(json);
  }

  final int required_;
  final int capacity;

  Map<String, dynamic> toJson() {
    return {'required': required_, 'capacity': capacity};
  }

  @override
  int get hashCode => Object.hash(required_, capacity);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipyardShipCrew &&
        required_ == other.required_ &&
        capacity == other.capacity;
  }
}
