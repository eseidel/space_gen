import 'package:meta/meta.dart';
import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/ship_cargo.dart';
import 'package:spacetraders/model/ship_refine201_response_data_consumed_inner.dart';
import 'package:spacetraders/model/ship_refine201_response_data_produced_inner.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class ShipRefine201ResponseData {
  const ShipRefine201ResponseData({
    required this.cargo,
    required this.cooldown,
    this.produced = const [],
    this.consumed = const [],
  });

  factory ShipRefine201ResponseData.fromJson(Map<String, dynamic> json) {
    return ShipRefine201ResponseData(
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      produced: (json['produced'] as List)
          .map<ShipRefine201ResponseDataProducedInner>(
            (e) => ShipRefine201ResponseDataProducedInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      consumed: (json['consumed'] as List)
          .map<ShipRefine201ResponseDataConsumedInner>(
            (e) => ShipRefine201ResponseDataConsumedInner.fromJson(
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
  final List<ShipRefine201ResponseDataProducedInner> produced;
  final List<ShipRefine201ResponseDataConsumedInner> consumed;

  Map<String, dynamic> toJson() {
    return {
      'cargo': cargo.toJson(),
      'cooldown': cooldown.toJson(),
      'produced': produced.map((e) => e.toJson()).toList(),
      'consumed': consumed.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hash(cargo, cooldown, produced, consumed);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipRefine201ResponseData &&
        cargo == other.cargo &&
        cooldown == other.cooldown &&
        listsEqual(produced, other.produced) &&
        listsEqual(consumed, other.consumed);
  }
}
