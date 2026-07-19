import 'package:github/model_helpers.dart';
import 'package:github/models/actions_hosted_runner_limits_public_ips.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsHostedRunnerLimits {
  const ActionsHostedRunnerLimits({required this.publicIps});

  /// Converts a `Map<String, dynamic>` to an [ActionsHostedRunnerLimits].
  factory ActionsHostedRunnerLimits.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsHostedRunnerLimits',
      json,
      () => ActionsHostedRunnerLimits(
        publicIps: ActionsHostedRunnerLimitsPublicIps.fromJson(
          json['public_ips'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsHostedRunnerLimits? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ActionsHostedRunnerLimits.fromJson(json);
  }

  /// Static public IP Limits for GitHub-hosted Hosted Runners.
  /// Provides details of static public IP limits for GitHub-hosted Hosted
  /// Runners
  final ActionsHostedRunnerLimitsPublicIps publicIps;

  /// Converts an [ActionsHostedRunnerLimits] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'public_ips': publicIps.toJson()};
  }

  @override
  int get hashCode => publicIps.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsHostedRunnerLimits && publicIps == other.publicIps;
  }
}
