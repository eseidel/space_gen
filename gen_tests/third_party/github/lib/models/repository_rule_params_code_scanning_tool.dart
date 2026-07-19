// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_params_code_scanning_tool_alerts_threshold.dart';
import 'package:github/models/repository_rule_params_code_scanning_tool_security_alerts_threshold.dart';
import 'package:meta/meta.dart';

/// {@template repository_rule_params_code_scanning_tool}
/// CodeScanningTool
/// A tool that must provide code scanning results for this rule to pass.
/// {@endtemplate}
@immutable
class RepositoryRuleParamsCodeScanningTool {
  /// {@macro repository_rule_params_code_scanning_tool}
  const RepositoryRuleParamsCodeScanningTool({
    required this.alertsThreshold,
    required this.securityAlertsThreshold,
    required this.tool,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleParamsCodeScanningTool].
  factory RepositoryRuleParamsCodeScanningTool.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleParamsCodeScanningTool',
      json,
      () => RepositoryRuleParamsCodeScanningTool(
        alertsThreshold:
            RepositoryRuleParamsCodeScanningToolAlertsThreshold.fromJson(
              json['alerts_threshold'] as String,
            ),
        securityAlertsThreshold:
            RepositoryRuleParamsCodeScanningToolSecurityAlertsThreshold.fromJson(
              json['security_alerts_threshold'] as String,
            ),
        tool: json['tool'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleParamsCodeScanningTool? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleParamsCodeScanningTool.fromJson(json);
  }

  /// The severity level at which code scanning results that raise alerts
  /// block a reference update. For more information on alert severity levels,
  /// see "[About code scanning
  /// alerts](https://docs.github.com/code-security/code-scanning/managing-code-scanning-alerts/about-code-scanning-alerts#about-alert-severity-and-security-severity-levels)."
  final RepositoryRuleParamsCodeScanningToolAlertsThreshold alertsThreshold;

  /// The severity level at which code scanning results that raise security
  /// alerts block a reference update. For more information on security
  /// severity levels, see "[About code scanning
  /// alerts](https://docs.github.com/code-security/code-scanning/managing-code-scanning-alerts/about-code-scanning-alerts#about-alert-severity-and-security-severity-levels)."
  final RepositoryRuleParamsCodeScanningToolSecurityAlertsThreshold
  securityAlertsThreshold;

  /// The name of a code scanning tool
  final String tool;

  /// Converts a [RepositoryRuleParamsCodeScanningTool]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'alerts_threshold': alertsThreshold.toJson(),
      'security_alerts_threshold': securityAlertsThreshold.toJson(),
      'tool': tool,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([alertsThreshold, securityAlertsThreshold, tool]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleParamsCodeScanningTool &&
        alertsThreshold == other.alertsThreshold &&
        securityAlertsThreshold == other.securityAlertsThreshold &&
        tool == other.tool;
  }
}
