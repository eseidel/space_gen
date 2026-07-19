import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template actions_hosted_runner_machine_spec}
/// Github-owned VM details.
/// Provides details of a particular machine spec.
/// {@endtemplate}
@immutable
class ActionsHostedRunnerMachineSpec {
  /// {@macro actions_hosted_runner_machine_spec}
  const ActionsHostedRunnerMachineSpec({
    required this.id,
    required this.cpuCores,
    required this.memoryGb,
    required this.storageGb,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsHostedRunnerMachineSpec].
  factory ActionsHostedRunnerMachineSpec.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsHostedRunnerMachineSpec',
      json,
      () => ActionsHostedRunnerMachineSpec(
        id: json['id'] as String,
        cpuCores: json['cpu_cores'] as int,
        memoryGb: json['memory_gb'] as int,
        storageGb: json['storage_gb'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsHostedRunnerMachineSpec? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsHostedRunnerMachineSpec.fromJson(json);
  }

  /// The ID used for the `size` parameter when creating a new runner.
  /// Example: `'8-core'`
  final String id;

  /// The number of cores.
  /// Example: `8`
  final int cpuCores;

  /// The available RAM for the machine spec.
  /// Example: `32`
  final int memoryGb;

  /// The available SSD storage for the machine spec.
  /// Example: `300`
  final int storageGb;

  /// Converts an [ActionsHostedRunnerMachineSpec] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cpu_cores': cpuCores,
      'memory_gb': memoryGb,
      'storage_gb': storageGb,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, cpuCores, memoryGb, storageGb]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsHostedRunnerMachineSpec &&
        id == other.id &&
        cpuCores == other.cpuCores &&
        memoryGb == other.memoryGb &&
        storageGb == other.storageGb;
  }
}
