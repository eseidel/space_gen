import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repository_rule_params_status_check_configuration}
/// StatusCheckConfiguration
/// Required status check
/// {@endtemplate}
@immutable
class RepositoryRuleParamsStatusCheckConfiguration {
  /// {@macro repository_rule_params_status_check_configuration}
  const RepositoryRuleParamsStatusCheckConfiguration({
    required this.context,
    this.integrationId,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleParamsStatusCheckConfiguration].
  factory RepositoryRuleParamsStatusCheckConfiguration.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleParamsStatusCheckConfiguration',
      json,
      () => RepositoryRuleParamsStatusCheckConfiguration(
        context: json['context'] as String,
        integrationId: json['integration_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleParamsStatusCheckConfiguration? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleParamsStatusCheckConfiguration.fromJson(json);
  }

  /// The status check context name that must be present on the commit.
  final String context;

  /// The optional integration ID that this status check must originate from.
  final int? integrationId;

  /// Converts a [RepositoryRuleParamsStatusCheckConfiguration]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'context': context,
      if (integrationId != null) 'integration_id': integrationId,
    };
  }

  @override
  int get hashCode => Object.hashAll([context, integrationId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleParamsStatusCheckConfiguration &&
        context == other.context &&
        integrationId == other.integrationId;
  }
}
