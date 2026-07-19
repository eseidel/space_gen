import 'package:github/model_helpers.dart';
import 'package:github/models/actions_hosted_runner_machine_spec.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsGetHostedRunnersMachineSpecsForOrg200Response {
  const ActionsGetHostedRunnersMachineSpecsForOrg200Response({
    required this.totalCount,
    required this.machineSpecs,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsGetHostedRunnersMachineSpecsForOrg200Response].
  factory ActionsGetHostedRunnersMachineSpecsForOrg200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsGetHostedRunnersMachineSpecsForOrg200Response',
      json,
      () => ActionsGetHostedRunnersMachineSpecsForOrg200Response(
        totalCount: json['total_count'] as int,
        machineSpecs: (json['machine_specs'] as List)
            .map<ActionsHostedRunnerMachineSpec>(
              (e) => ActionsHostedRunnerMachineSpec.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsGetHostedRunnersMachineSpecsForOrg200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsGetHostedRunnersMachineSpecsForOrg200Response.fromJson(json);
  }

  final int totalCount;
  final List<ActionsHostedRunnerMachineSpec> machineSpecs;

  /// Converts an [ActionsGetHostedRunnersMachineSpecsForOrg200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'machine_specs': machineSpecs.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(machineSpecs)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsGetHostedRunnersMachineSpecsForOrg200Response &&
        totalCount == other.totalCount &&
        listsEqual(machineSpecs, other.machineSpecs);
  }
}
