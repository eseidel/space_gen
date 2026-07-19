import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_nav.dart';

@immutable
class DockShip200ResponseData {
  const DockShip200ResponseData({required this.nav});

  /// Converts a `Map<String, dynamic>` to a [DockShip200ResponseData].
  factory DockShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DockShip200ResponseData',
      json,
      () => DockShip200ResponseData(
        nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
      ),
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

  /// The navigation information of the ship.
  final ShipNav nav;

  /// Converts a [DockShip200ResponseData] to a `Map<String, dynamic>`.
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
