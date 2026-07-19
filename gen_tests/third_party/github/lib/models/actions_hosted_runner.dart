import 'package:github/model_helpers.dart';
import 'package:github/models/actions_hosted_runner_machine_spec.dart';
import 'package:github/models/actions_hosted_runner_pool_image.dart';
import 'package:github/models/actions_hosted_runner_status.dart';
import 'package:github/models/public_ip.dart';
import 'package:meta/meta.dart';

/// {@template actions_hosted_runner}
/// GitHub-hosted hosted runner
/// A Github-hosted hosted runner.
/// {@endtemplate}
@immutable
class ActionsHostedRunner {
  /// {@macro actions_hosted_runner}
  const ActionsHostedRunner({
    required this.id,
    required this.name,
    required this.imageDetails,
    required this.machineSizeDetails,
    required this.status,
    required this.platform,
    required this.publicIpEnabled,
    this.runnerGroupId,
    this.maximumRunners = 10,
    this.publicIps,
    this.lastActiveOn,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsHostedRunner].
  factory ActionsHostedRunner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsHostedRunner',
      json,
      () => ActionsHostedRunner(
        id: json['id'] as int,
        name: json['name'] as String,
        runnerGroupId: json['runner_group_id'] as int?,
        imageDetails: ActionsHostedRunnerPoolImage.maybeFromJson(
          checkedKey(json, 'image_details') as Map<String, dynamic>?,
        ),
        machineSizeDetails: ActionsHostedRunnerMachineSpec.fromJson(
          json['machine_size_details'] as Map<String, dynamic>,
        ),
        status: ActionsHostedRunnerStatus.fromJson(json['status'] as String),
        platform: json['platform'] as String,
        maximumRunners: (json['maximum_runners'] as int?) ?? 10,
        publicIpEnabled: json['public_ip_enabled'] as bool,
        publicIps: (json['public_ips'] as List?)
            ?.map<PublicIp>((e) => PublicIp.fromJson(e as Map<String, dynamic>))
            .toList(),
        lastActiveOn: maybeParseDateTime(json['last_active_on'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsHostedRunner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ActionsHostedRunner.fromJson(json);
  }

  /// The unique identifier of the hosted runner.
  /// Example: `5`
  final int id;

  /// The name of the hosted runner.
  /// Example: `'my-github-hosted-runner'`
  final String name;

  /// The unique identifier of the group that the hosted runner belongs to.
  /// Example: `2`
  final int? runnerGroupId;

  /// GitHub-hosted runner image details.
  /// Provides details of a hosted runner image
  final ActionsHostedRunnerPoolImage? imageDetails;

  /// Github-owned VM details.
  /// Provides details of a particular machine spec.
  final ActionsHostedRunnerMachineSpec machineSizeDetails;

  /// The status of the runner.
  /// Example: `'Ready'`
  final ActionsHostedRunnerStatus status;

  /// The operating system of the image.
  /// Example: `'linux-x64'`
  final String platform;

  /// The maximum amount of hosted runners. Runners will not scale
  /// automatically above this number. Use this setting to limit your cost.
  /// Example: `5`
  final int maximumRunners;

  /// Whether public IP is enabled for the hosted runners.
  /// Example: `true`
  final bool publicIpEnabled;

  /// The public IP ranges when public IP is enabled for the hosted runners.
  final List<PublicIp>? publicIps;

  /// The time at which the runner was last used, in ISO 8601 format.
  /// Example: `'2022-10-09T23:39:01Z'`
  final DateTime? lastActiveOn;

  /// Converts an [ActionsHostedRunner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (runnerGroupId != null) 'runner_group_id': runnerGroupId,
      'image_details': imageDetails?.toJson(),
      'machine_size_details': machineSizeDetails.toJson(),
      'status': status.toJson(),
      'platform': platform,
      'maximum_runners': maximumRunners,
      'public_ip_enabled': publicIpEnabled,
      if (publicIps != null)
        'public_ips': publicIps?.map((e) => e.toJson()).toList(),
      'last_active_on': lastActiveOn?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    runnerGroupId,
    imageDetails,
    machineSizeDetails,
    status,
    platform,
    maximumRunners,
    publicIpEnabled,
    listHash(publicIps),
    lastActiveOn,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsHostedRunner &&
        id == other.id &&
        name == other.name &&
        runnerGroupId == other.runnerGroupId &&
        imageDetails == other.imageDetails &&
        machineSizeDetails == other.machineSizeDetails &&
        status == other.status &&
        platform == other.platform &&
        maximumRunners == other.maximumRunners &&
        publicIpEnabled == other.publicIpEnabled &&
        listsEqual(publicIps, other.publicIps) &&
        lastActiveOn == other.lastActiveOn;
  }
}
