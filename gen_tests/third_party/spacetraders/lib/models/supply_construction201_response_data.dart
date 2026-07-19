import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/construction.dart';
import 'package:spacetraders/models/ship_cargo.dart';

@immutable
class SupplyConstruction201ResponseData {
  const SupplyConstruction201ResponseData({
    required this.construction,
    required this.cargo,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SupplyConstruction201ResponseData].
  factory SupplyConstruction201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SupplyConstruction201ResponseData',
      json,
      () => SupplyConstruction201ResponseData(
        construction: Construction.fromJson(
          json['construction'] as Map<String, dynamic>,
        ),
        cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SupplyConstruction201ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SupplyConstruction201ResponseData.fromJson(json);
  }

  /// The construction details of a waypoint.
  final Construction construction;

  /// Ship cargo details.
  final ShipCargo cargo;

  /// Converts a [SupplyConstruction201ResponseData]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'construction': construction.toJson(), 'cargo': cargo.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([construction, cargo]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SupplyConstruction201ResponseData &&
        construction == other.construction &&
        cargo == other.cargo;
  }
}
