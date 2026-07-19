import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_params_status_check_configuration.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleRequiredStatusChecksParameters {
  const RepositoryRuleRequiredStatusChecksParameters({
    required this.requiredStatusChecks,
    required this.strictRequiredStatusChecksPolicy,
    this.doNotEnforceOnCreate,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleRequiredStatusChecksParameters].
  factory RepositoryRuleRequiredStatusChecksParameters.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleRequiredStatusChecksParameters',
      json,
      () => RepositoryRuleRequiredStatusChecksParameters(
        doNotEnforceOnCreate: json['do_not_enforce_on_create'] as bool?,
        requiredStatusChecks: (json['required_status_checks'] as List)
            .map<RepositoryRuleParamsStatusCheckConfiguration>(
              (e) => RepositoryRuleParamsStatusCheckConfiguration.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        strictRequiredStatusChecksPolicy:
            json['strict_required_status_checks_policy'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleRequiredStatusChecksParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleRequiredStatusChecksParameters.fromJson(json);
  }

  /// Allow repositories and branches to be created if a check would otherwise
  /// prohibit it.
  final bool? doNotEnforceOnCreate;

  /// Status checks that are required.
  final List<RepositoryRuleParamsStatusCheckConfiguration> requiredStatusChecks;

  /// Whether pull requests targeting a matching branch must be tested with
  /// the latest code. This setting will not take effect unless at least one
  /// status check is enabled.
  final bool strictRequiredStatusChecksPolicy;

  /// Converts a [RepositoryRuleRequiredStatusChecksParameters]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'do_not_enforce_on_create': ?doNotEnforceOnCreate,
      'required_status_checks': requiredStatusChecks
          .map((e) => e.toJson())
          .toList(),
      'strict_required_status_checks_policy': strictRequiredStatusChecksPolicy,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    doNotEnforceOnCreate,
    listHash(requiredStatusChecks),
    strictRequiredStatusChecksPolicy,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleRequiredStatusChecksParameters &&
        doNotEnforceOnCreate == other.doNotEnforceOnCreate &&
        listsEqual(requiredStatusChecks, other.requiredStatusChecks) &&
        strictRequiredStatusChecksPolicy ==
            other.strictRequiredStatusChecksPolicy;
  }
}
