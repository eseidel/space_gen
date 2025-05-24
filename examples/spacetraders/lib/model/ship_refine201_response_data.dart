import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/ship_cargo.dart';
import 'package:spacetraders/model/ship_refine201_response_data_consumed_item.dart';
import 'package:spacetraders/model/ship_refine201_response_data_produced_item.dart';

class ShipRefine201ResponseData {
  ShipRefine201ResponseData({
    required this.cargo,
    required this.cooldown,
    required this.produced,
    required this.consumed,
  });

  factory ShipRefine201ResponseData.fromJson(Map<String, dynamic> json) {
    return ShipRefine201ResponseData(
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      produced:
          (json['produced'] as List<dynamic>)
              .map<ShipRefine201ResponseDataProducedItem>(
                (e) => ShipRefine201ResponseDataProducedItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
      consumed:
          (json['consumed'] as List<dynamic>)
              .map<ShipRefine201ResponseDataConsumedItem>(
                (e) => ShipRefine201ResponseDataConsumedItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipRefine201ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipRefine201ResponseData.fromJson(json);
  }

  final ShipCargo cargo;
  final Cooldown cooldown;
  final List<ShipRefine201ResponseDataProducedItem> produced;
  final List<ShipRefine201ResponseDataConsumedItem> consumed;

  Map<String, dynamic> toJson() {
    return {
      'cargo': cargo.toJson(),
      'cooldown': cooldown.toJson(),
      'produced': produced.map((e) => e.toJson()).toList(),
      'consumed': consumed.map((e) => e.toJson()).toList(),
    };
  }
}
