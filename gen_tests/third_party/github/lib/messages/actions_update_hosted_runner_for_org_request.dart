// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsUpdateHostedRunnerForOrgRequest {
  const ActionsUpdateHostedRunnerForOrgRequest({
    this.name,
    this.runnerGroupId,
    this.maximumRunners,
    this.enableStaticIp,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsUpdateHostedRunnerForOrgRequest].
  factory ActionsUpdateHostedRunnerForOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsUpdateHostedRunnerForOrgRequest',
      json,
      () => ActionsUpdateHostedRunnerForOrgRequest(
        name: json['name'] as String?,
        runnerGroupId: json['runner_group_id'] as int?,
        maximumRunners: json['maximum_runners'] as int?,
        enableStaticIp: json['enable_static_ip'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsUpdateHostedRunnerForOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsUpdateHostedRunnerForOrgRequest.fromJson(json);
  }

  /// Name of the runner. Must be between 1 and 64 characters and may only
  /// contain upper and lowercase letters a-z, numbers 0-9, '.', '-', and '_'.
  final String? name;

  /// The existing runner group to add this runner to.
  final int? runnerGroupId;

  /// The maximum amount of runners to scale up to. Runners will not
  /// auto-scale above this number. Use this setting to limit your cost.
  final int? maximumRunners;

  /// Whether this runner should be updated with a static public IP. Note
  /// limit on account. To list limits on account, use `GET actions/hosted-runners/limits`
  final bool? enableStaticIp;

  /// Converts an [ActionsUpdateHostedRunnerForOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (runnerGroupId != null) 'runner_group_id': runnerGroupId,
      if (maximumRunners != null) 'maximum_runners': maximumRunners,
      if (enableStaticIp != null) 'enable_static_ip': enableStaticIp,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, runnerGroupId, maximumRunners, enableStaticIp]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsUpdateHostedRunnerForOrgRequest &&
        name == other.name &&
        runnerGroupId == other.runnerGroupId &&
        maximumRunners == other.maximumRunners &&
        enableStaticIp == other.enableStaticIp;
  }
}
