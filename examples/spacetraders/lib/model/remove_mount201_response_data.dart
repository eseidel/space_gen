import 'package:meta/meta.dart';
import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/ship_cargo.dart';
import 'package:spacetraders/model/ship_modification_transaction.dart';
import 'package:spacetraders/model/ship_mount.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class RemoveMount201ResponseData {
  const RemoveMount201ResponseData({
    required this.agent,
    required this.cargo,
    required this.transaction,
    this.mounts = const [],
  });

  factory RemoveMount201ResponseData.fromJson(Map<String, dynamic> json) {
    return RemoveMount201ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      mounts: (json['mounts'] as List)
          .map<ShipMount>((e) => ShipMount.fromJson(e as Map<String, dynamic>))
          .toList(),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      transaction: ShipModificationTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RemoveMount201ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RemoveMount201ResponseData.fromJson(json);
  }

  final Agent agent;
  final List<ShipMount> mounts;
  final ShipCargo cargo;
  final ShipModificationTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'mounts': mounts.map((e) => e.toJson()).toList(),
      'cargo': cargo.toJson(),
      'transaction': transaction.toJson(),
    };
  }

  @override
  int get hashCode => Object.hash(agent, mounts, cargo, transaction);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RemoveMount201ResponseData &&
        agent == other.agent &&
        listsEqual(mounts, other.mounts) &&
        cargo == other.cargo &&
        transaction == other.transaction;
  }
}
