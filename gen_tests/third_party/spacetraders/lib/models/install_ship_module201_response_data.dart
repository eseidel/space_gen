import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent.dart';
import 'package:spacetraders/models/ship_cargo.dart';
import 'package:spacetraders/models/ship_modification_transaction.dart';
import 'package:spacetraders/models/ship_module.dart';

@immutable
class InstallShipModule201ResponseData {
  const InstallShipModule201ResponseData({
    required this.agent,
    required this.modules,
    required this.cargo,
    required this.transaction,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [InstallShipModule201ResponseData].
  factory InstallShipModule201ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InstallShipModule201ResponseData',
      json,
      () => InstallShipModule201ResponseData(
        agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
        modules: (json['modules'] as List)
            .map<ShipModule>(
              (e) => ShipModule.fromJson(e as Map<String, dynamic>),
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
  static InstallShipModule201ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return InstallShipModule201ResponseData.fromJson(json);
  }

  /// Agent details.
  final Agent agent;
  final List<ShipModule> modules;

  /// Ship cargo details.
  final ShipCargo cargo;

  /// Result of a transaction for a ship modification, such as installing a
  /// mount or a module.
  final ShipModificationTransaction transaction;

  /// Converts an [InstallShipModule201ResponseData]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'modules': modules.map((e) => e.toJson()).toList(),
      'cargo': cargo.toJson(),
      'transaction': transaction.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([agent, listHash(modules), cargo, transaction]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InstallShipModule201ResponseData &&
        agent == other.agent &&
        listsEqual(modules, other.modules) &&
        cargo == other.cargo &&
        transaction == other.transaction;
  }
}
