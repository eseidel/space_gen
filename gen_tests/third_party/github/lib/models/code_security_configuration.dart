// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/code_security_configuration_advanced_security.dart';
import 'package:github/models/code_security_configuration_code_scanning_default_setup.dart';
import 'package:github/models/code_security_configuration_code_scanning_default_setup_options.dart';
import 'package:github/models/code_security_configuration_code_scanning_delegated_alert_dismissal.dart';
import 'package:github/models/code_security_configuration_dependabot_alerts.dart';
import 'package:github/models/code_security_configuration_dependabot_security_updates.dart';
import 'package:github/models/code_security_configuration_dependency_graph.dart';
import 'package:github/models/code_security_configuration_dependency_graph_autosubmit_action.dart';
import 'package:github/models/code_security_configuration_dependency_graph_autosubmit_action_options.dart';
import 'package:github/models/code_security_configuration_enforcement.dart';
import 'package:github/models/code_security_configuration_private_vulnerability_reporting.dart';
import 'package:github/models/code_security_configuration_secret_scanning.dart';
import 'package:github/models/code_security_configuration_secret_scanning_delegated_alert_dismissal.dart';
import 'package:github/models/code_security_configuration_secret_scanning_delegated_bypass.dart';
import 'package:github/models/code_security_configuration_secret_scanning_delegated_bypass_options.dart';
import 'package:github/models/code_security_configuration_secret_scanning_generic_secrets.dart';
import 'package:github/models/code_security_configuration_secret_scanning_non_provider_patterns.dart';
import 'package:github/models/code_security_configuration_secret_scanning_push_protection.dart';
import 'package:github/models/code_security_configuration_secret_scanning_validity_checks.dart';
import 'package:github/models/code_security_configuration_target_type.dart';
import 'package:meta/meta.dart';

/// {@template code_security_configuration}
/// A code security configuration
/// {@endtemplate}
@immutable
class CodeSecurityConfiguration {
  /// {@macro code_security_configuration}
  const CodeSecurityConfiguration({
    this.id,
    this.name,
    this.targetType,
    this.description,
    this.advancedSecurity,
    this.dependencyGraph,
    this.dependencyGraphAutosubmitAction,
    this.dependencyGraphAutosubmitActionOptions,
    this.dependabotAlerts,
    this.dependabotSecurityUpdates,
    this.codeScanningDefaultSetup,
    this.codeScanningDefaultSetupOptions,
    this.codeScanningDelegatedAlertDismissal,
    this.secretScanning,
    this.secretScanningPushProtection,
    this.secretScanningDelegatedBypass,
    this.secretScanningDelegatedBypassOptions,
    this.secretScanningValidityChecks,
    this.secretScanningNonProviderPatterns,
    this.secretScanningGenericSecrets,
    this.secretScanningDelegatedAlertDismissal,
    this.privateVulnerabilityReporting,
    this.enforcement,
    this.url,
    this.htmlUrl,
    this.createdAt,
    this.updatedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeSecurityConfiguration].
  factory CodeSecurityConfiguration.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeSecurityConfiguration',
      json,
      () => CodeSecurityConfiguration(
        id: json['id'] as int?,
        name: json['name'] as String?,
        targetType: CodeSecurityConfigurationTargetType.maybeFromJson(
          json['target_type'] as String?,
        ),
        description: json['description'] as String?,
        advancedSecurity:
            CodeSecurityConfigurationAdvancedSecurity.maybeFromJson(
              json['advanced_security'] as String?,
            ),
        dependencyGraph: CodeSecurityConfigurationDependencyGraph.maybeFromJson(
          json['dependency_graph'] as String?,
        ),
        dependencyGraphAutosubmitAction:
            CodeSecurityConfigurationDependencyGraphAutosubmitAction.maybeFromJson(
              json['dependency_graph_autosubmit_action'] as String?,
            ),
        dependencyGraphAutosubmitActionOptions:
            CodeSecurityConfigurationDependencyGraphAutosubmitActionOptions.maybeFromJson(
              json['dependency_graph_autosubmit_action_options']
                  as Map<String, dynamic>?,
            ),
        dependabotAlerts:
            CodeSecurityConfigurationDependabotAlerts.maybeFromJson(
              json['dependabot_alerts'] as String?,
            ),
        dependabotSecurityUpdates:
            CodeSecurityConfigurationDependabotSecurityUpdates.maybeFromJson(
              json['dependabot_security_updates'] as String?,
            ),
        codeScanningDefaultSetup:
            CodeSecurityConfigurationCodeScanningDefaultSetup.maybeFromJson(
              json['code_scanning_default_setup'] as String?,
            ),
        codeScanningDefaultSetupOptions:
            CodeSecurityConfigurationCodeScanningDefaultSetupOptions.maybeFromJson(
              json['code_scanning_default_setup_options']
                  as Map<String, dynamic>?,
            ),
        codeScanningDelegatedAlertDismissal:
            CodeSecurityConfigurationCodeScanningDelegatedAlertDismissal.maybeFromJson(
              json['code_scanning_delegated_alert_dismissal'] as String?,
            ),
        secretScanning: CodeSecurityConfigurationSecretScanning.maybeFromJson(
          json['secret_scanning'] as String?,
        ),
        secretScanningPushProtection:
            CodeSecurityConfigurationSecretScanningPushProtection.maybeFromJson(
              json['secret_scanning_push_protection'] as String?,
            ),
        secretScanningDelegatedBypass:
            CodeSecurityConfigurationSecretScanningDelegatedBypass.maybeFromJson(
              json['secret_scanning_delegated_bypass'] as String?,
            ),
        secretScanningDelegatedBypassOptions:
            CodeSecurityConfigurationSecretScanningDelegatedBypassOptions.maybeFromJson(
              json['secret_scanning_delegated_bypass_options']
                  as Map<String, dynamic>?,
            ),
        secretScanningValidityChecks:
            CodeSecurityConfigurationSecretScanningValidityChecks.maybeFromJson(
              json['secret_scanning_validity_checks'] as String?,
            ),
        secretScanningNonProviderPatterns:
            CodeSecurityConfigurationSecretScanningNonProviderPatterns.maybeFromJson(
              json['secret_scanning_non_provider_patterns'] as String?,
            ),
        secretScanningGenericSecrets:
            CodeSecurityConfigurationSecretScanningGenericSecrets.maybeFromJson(
              json['secret_scanning_generic_secrets'] as String?,
            ),
        secretScanningDelegatedAlertDismissal:
            CodeSecurityConfigurationSecretScanningDelegatedAlertDismissal.maybeFromJson(
              json['secret_scanning_delegated_alert_dismissal'] as String?,
            ),
        privateVulnerabilityReporting:
            CodeSecurityConfigurationPrivateVulnerabilityReporting.maybeFromJson(
              json['private_vulnerability_reporting'] as String?,
            ),
        enforcement: CodeSecurityConfigurationEnforcement.maybeFromJson(
          json['enforcement'] as String?,
        ),
        url: maybeParseUri(json['url'] as String?),
        htmlUrl: maybeParseUri(json['html_url'] as String?),
        createdAt: maybeParseDateTime(json['created_at'] as String?),
        updatedAt: maybeParseDateTime(json['updated_at'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityConfiguration? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityConfiguration.fromJson(json);
  }

  /// The ID of the code security configuration
  final int? id;

  /// The name of the code security configuration. Must be unique within the
  /// organization.
  final String? name;

  /// The type of the code security configuration.
  final CodeSecurityConfigurationTargetType? targetType;

  /// A description of the code security configuration
  final String? description;

  /// The enablement status of GitHub Advanced Security
  final CodeSecurityConfigurationAdvancedSecurity? advancedSecurity;

  /// The enablement status of Dependency Graph
  final CodeSecurityConfigurationDependencyGraph? dependencyGraph;

  /// The enablement status of Automatic dependency submission
  final CodeSecurityConfigurationDependencyGraphAutosubmitAction?
  dependencyGraphAutosubmitAction;

  /// Feature options for Automatic dependency submission
  final CodeSecurityConfigurationDependencyGraphAutosubmitActionOptions?
  dependencyGraphAutosubmitActionOptions;

  /// The enablement status of Dependabot alerts
  final CodeSecurityConfigurationDependabotAlerts? dependabotAlerts;

  /// The enablement status of Dependabot security updates
  final CodeSecurityConfigurationDependabotSecurityUpdates?
  dependabotSecurityUpdates;

  /// The enablement status of code scanning default setup
  final CodeSecurityConfigurationCodeScanningDefaultSetup?
  codeScanningDefaultSetup;

  /// Feature options for code scanning default setup
  final CodeSecurityConfigurationCodeScanningDefaultSetupOptions?
  codeScanningDefaultSetupOptions;

  /// The enablement status of code scanning delegated alert dismissal
  final CodeSecurityConfigurationCodeScanningDelegatedAlertDismissal?
  codeScanningDelegatedAlertDismissal;

  /// The enablement status of secret scanning
  final CodeSecurityConfigurationSecretScanning? secretScanning;

  /// The enablement status of secret scanning push protection
  final CodeSecurityConfigurationSecretScanningPushProtection?
  secretScanningPushProtection;

  /// The enablement status of secret scanning delegated bypass
  final CodeSecurityConfigurationSecretScanningDelegatedBypass?
  secretScanningDelegatedBypass;

  /// Feature options for secret scanning delegated bypass
  final CodeSecurityConfigurationSecretScanningDelegatedBypassOptions?
  secretScanningDelegatedBypassOptions;

  /// The enablement status of secret scanning validity checks
  final CodeSecurityConfigurationSecretScanningValidityChecks?
  secretScanningValidityChecks;

  /// The enablement status of secret scanning non-provider patterns
  final CodeSecurityConfigurationSecretScanningNonProviderPatterns?
  secretScanningNonProviderPatterns;

  /// The enablement status of Copilot secret scanning
  final CodeSecurityConfigurationSecretScanningGenericSecrets?
  secretScanningGenericSecrets;

  /// The enablement status of secret scanning delegated alert dismissal
  final CodeSecurityConfigurationSecretScanningDelegatedAlertDismissal?
  secretScanningDelegatedAlertDismissal;

  /// The enablement status of private vulnerability reporting
  final CodeSecurityConfigurationPrivateVulnerabilityReporting?
  privateVulnerabilityReporting;

  /// The enforcement status for a security configuration
  final CodeSecurityConfigurationEnforcement? enforcement;

  /// The URL of the configuration
  final Uri? url;

  /// The URL of the configuration
  final Uri? htmlUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// Converts a [CodeSecurityConfiguration] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (targetType != null) 'target_type': targetType?.toJson(),
      if (description != null) 'description': description,
      if (advancedSecurity != null)
        'advanced_security': advancedSecurity?.toJson(),
      if (dependencyGraph != null)
        'dependency_graph': dependencyGraph?.toJson(),
      if (dependencyGraphAutosubmitAction != null)
        'dependency_graph_autosubmit_action': dependencyGraphAutosubmitAction
            ?.toJson(),
      if (dependencyGraphAutosubmitActionOptions != null)
        'dependency_graph_autosubmit_action_options':
            dependencyGraphAutosubmitActionOptions?.toJson(),
      if (dependabotAlerts != null)
        'dependabot_alerts': dependabotAlerts?.toJson(),
      if (dependabotSecurityUpdates != null)
        'dependabot_security_updates': dependabotSecurityUpdates?.toJson(),
      if (codeScanningDefaultSetup != null)
        'code_scanning_default_setup': codeScanningDefaultSetup?.toJson(),
      'code_scanning_default_setup_options': codeScanningDefaultSetupOptions
          ?.toJson(),
      if (codeScanningDelegatedAlertDismissal != null)
        'code_scanning_delegated_alert_dismissal':
            codeScanningDelegatedAlertDismissal?.toJson(),
      if (secretScanning != null) 'secret_scanning': secretScanning?.toJson(),
      if (secretScanningPushProtection != null)
        'secret_scanning_push_protection': secretScanningPushProtection
            ?.toJson(),
      if (secretScanningDelegatedBypass != null)
        'secret_scanning_delegated_bypass': secretScanningDelegatedBypass
            ?.toJson(),
      if (secretScanningDelegatedBypassOptions != null)
        'secret_scanning_delegated_bypass_options':
            secretScanningDelegatedBypassOptions?.toJson(),
      if (secretScanningValidityChecks != null)
        'secret_scanning_validity_checks': secretScanningValidityChecks
            ?.toJson(),
      if (secretScanningNonProviderPatterns != null)
        'secret_scanning_non_provider_patterns':
            secretScanningNonProviderPatterns?.toJson(),
      if (secretScanningGenericSecrets != null)
        'secret_scanning_generic_secrets': secretScanningGenericSecrets
            ?.toJson(),
      if (secretScanningDelegatedAlertDismissal != null)
        'secret_scanning_delegated_alert_dismissal':
            secretScanningDelegatedAlertDismissal?.toJson(),
      if (privateVulnerabilityReporting != null)
        'private_vulnerability_reporting': privateVulnerabilityReporting
            ?.toJson(),
      if (enforcement != null) 'enforcement': enforcement?.toJson(),
      if (url != null) 'url': url?.toString(),
      if (htmlUrl != null) 'html_url': htmlUrl?.toString(),
      if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    targetType,
    description,
    advancedSecurity,
    dependencyGraph,
    dependencyGraphAutosubmitAction,
    dependencyGraphAutosubmitActionOptions,
    dependabotAlerts,
    dependabotSecurityUpdates,
    codeScanningDefaultSetup,
    codeScanningDefaultSetupOptions,
    codeScanningDelegatedAlertDismissal,
    secretScanning,
    secretScanningPushProtection,
    secretScanningDelegatedBypass,
    secretScanningDelegatedBypassOptions,
    secretScanningValidityChecks,
    secretScanningNonProviderPatterns,
    secretScanningGenericSecrets,
    secretScanningDelegatedAlertDismissal,
    privateVulnerabilityReporting,
    enforcement,
    url,
    htmlUrl,
    createdAt,
    updatedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeSecurityConfiguration &&
        id == other.id &&
        name == other.name &&
        targetType == other.targetType &&
        description == other.description &&
        advancedSecurity == other.advancedSecurity &&
        dependencyGraph == other.dependencyGraph &&
        dependencyGraphAutosubmitAction ==
            other.dependencyGraphAutosubmitAction &&
        dependencyGraphAutosubmitActionOptions ==
            other.dependencyGraphAutosubmitActionOptions &&
        dependabotAlerts == other.dependabotAlerts &&
        dependabotSecurityUpdates == other.dependabotSecurityUpdates &&
        codeScanningDefaultSetup == other.codeScanningDefaultSetup &&
        codeScanningDefaultSetupOptions ==
            other.codeScanningDefaultSetupOptions &&
        codeScanningDelegatedAlertDismissal ==
            other.codeScanningDelegatedAlertDismissal &&
        secretScanning == other.secretScanning &&
        secretScanningPushProtection == other.secretScanningPushProtection &&
        secretScanningDelegatedBypass == other.secretScanningDelegatedBypass &&
        secretScanningDelegatedBypassOptions ==
            other.secretScanningDelegatedBypassOptions &&
        secretScanningValidityChecks == other.secretScanningValidityChecks &&
        secretScanningNonProviderPatterns ==
            other.secretScanningNonProviderPatterns &&
        secretScanningGenericSecrets == other.secretScanningGenericSecrets &&
        secretScanningDelegatedAlertDismissal ==
            other.secretScanningDelegatedAlertDismissal &&
        privateVulnerabilityReporting == other.privateVulnerabilityReporting &&
        enforcement == other.enforcement &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
