import 'package:meta/meta.dart';
import 'package:spacetraders/model/ship_nav.dart';

@immutable
class DockShip200ResponseData {
  const DockShip200ResponseData({required this.nav});

  factory DockShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return DockShip200ResponseData(
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DockShip200ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DockShip200ResponseData.fromJson(json);
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
    return other is DockShip200ResponseData && nav == other.nav;
  }
}
