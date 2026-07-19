import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template actions_hosted_runner_limits_public_ips}
/// Static public IP Limits for GitHub-hosted Hosted Runners.
/// Provides details of static public IP limits for GitHub-hosted Hosted Runners
/// {@endtemplate}
@immutable
class ActionsHostedRunnerLimitsPublicIps {
  /// {@macro actions_hosted_runner_limits_public_ips}
  const ActionsHostedRunnerLimitsPublicIps({
    required this.maximum,
    required this.currentUsage,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsHostedRunnerLimitsPublicIps].
  factory ActionsHostedRunnerLimitsPublicIps.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsHostedRunnerLimitsPublicIps',
      json,
      () => ActionsHostedRunnerLimitsPublicIps(
        maximum: json['maximum'] as int,
        currentUsage: json['current_usage'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsHostedRunnerLimitsPublicIps? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsHostedRunnerLimitsPublicIps.fromJson(json);
  }

  /// The maximum number of static public IP addresses that can be used for
  /// Hosted Runners.
  /// Example: `50`
  final int maximum;

  /// The current number of static public IP addresses in use by Hosted
  /// Runners.
  /// Example: `17`
  final int currentUsage;

  /// Converts an [ActionsHostedRunnerLimitsPublicIps]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'maximum': maximum, 'current_usage': currentUsage};
  }

  @override
  int get hashCode => Object.hashAll([maximum, currentUsage]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsHostedRunnerLimitsPublicIps &&
        maximum == other.maximum &&
        currentUsage == other.currentUsage;
  }
}
