import 'package:meta/meta.dart';
import 'package:spacetraders/model/ship_nav.dart';

@immutable
class OrbitShip200ResponseData {
  const OrbitShip200ResponseData({required this.nav});

  factory OrbitShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return OrbitShip200ResponseData(
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrbitShip200ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrbitShip200ResponseData.fromJson(json);
  }

  final ShipNav nav;

  Map<String, dynamic> toJson() {
    return {'nav': nav.toJson()};
  }

  @override
  int get hashCode => nav.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrbitShip200ResponseData && nav == other.nav;
  }
}
