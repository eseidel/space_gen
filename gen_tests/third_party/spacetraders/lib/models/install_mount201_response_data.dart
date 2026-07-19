import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent.dart';
import 'package:spacetraders/models/ship_cargo.dart';
import 'package:spacetraders/models/ship_modification_transaction.dart';
import 'package:spacetraders/models/ship_mount.dart';

@immutable
class InstallMount201ResponseData {
  const InstallMount201ResponseData({
    required this.agent,
    required this.mounts,
    required this.cargo,
    required this.transaction,
  });

  /// Converts a `Map<String, dynamic>` to an [InstallMount201ResponseData].
  factory InstallMount201ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InstallMount201ResponseData',
      json,
      () => InstallMount201ResponseData(
        agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
        mounts: (json['mounts'] as List)
            .map<ShipMount>(
              (e) => ShipMount.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
        transaction: ShipModificationTransaction.fromJson(
          json['transaction'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InstallMount201ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return InstallMount201ResponseData.fromJson(json);
  }

  /// Agent details.
  final Agent agent;

  /// List of installed mounts after the installation of the new mount.
  final List<ShipMount> mounts;

  /// Ship cargo details.
  final ShipCargo cargo;

  /// Result of a transaction for a ship modification, such as installing a
  /// mount or a module.
  final ShipModificationTransaction transaction;

  /// Converts an [InstallMount201ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'mounts': mounts.map((e) => e.toJson()).toList(),
      'cargo': cargo.toJson(),
      'transaction': transaction.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([agent, listHash(mounts), cargo, transaction]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InstallMount201ResponseData &&
        agent == other.agent &&
        listsEqual(mounts, other.mounts) &&
        cargo == other.cargo &&
        transaction == other.transaction;
  }
}
