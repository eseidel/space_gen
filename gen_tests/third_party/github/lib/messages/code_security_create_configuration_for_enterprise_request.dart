// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_default_setup_options.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_advanced_security.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_code_scanning_default_setup.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_code_scanning_delegated_alert_dismissal.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_dependabot_alerts.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_dependabot_security_updates.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_dependency_graph.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_dependency_graph_autosubmit_action.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_dependency_graph_autosubmit_action_options.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_enforcement.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_private_vulnerability_reporting.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_secret_scanning.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_secret_scanning_delegated_alert_dismissal.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_secret_scanning_generic_secrets.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_secret_scanning_non_provider_patterns.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_secret_scanning_push_protection.dart';
import 'package:github/models/code_security_create_configuration_for_enterprise_request_secret_scanning_validity_checks.dart';
import 'package:meta/meta.dart';

@immutable
class CodeSecurityCreateConfigurationForEnterpriseRequest {
  const CodeSecurityCreateConfigurationForEnterpriseRequest({
    required this.name,
    required this.description,
    this.advancedSecurity = .disabled,
    this.dependencyGraph = .enabled,
    this.dependencyGraphAutosubmitAction = .disabled,
    this.dependencyGraphAutosubmitActionOptions,
    this.dependabotAlerts = .disabled,
    this.dependabotSecurityUpdates = .disabled,
    this.codeScanningDefaultSetup = .disabled,
    this.codeScanningDefaultSetupOptions,
    this.codeScanningDelegatedAlertDismissal = .disabled,
    this.secretScanning = .disabled,
    this.secretScanningPushProtection = .disabled,
    this.secretScanningValidityChecks = .disabled,
    this.secretScanningNonProviderPatterns = .disabled,
    this.secretScanningGenericSecrets = .disabled,
    this.secretScanningDelegatedAlertDismissal = .disabled,
    this.privateVulnerabilityReporting = .disabled,
    this.enforcement = .enforced,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityCreateConfigurationForEnterpriseRequest].
  factory CodeSecurityCreateConfigurationForEnterpriseRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityCreateConfigurationForEnterpriseRequest',
      json,
      () => CodeSecurityCreateConfigurationForEnterpriseRequest(
        name: json['name'] as String,
        description: json['description'] as String,
        advancedSecurity:
            CodeSecurityCreateConfigurationForEnterpriseRequestAdvancedSecurity.maybeFromJson(
              json['advanced_security'] as String?,
            ) ??
            .disabled,
        dependencyGraph:
            CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraph.maybeFromJson(
              json['dependency_graph'] as String?,
            ) ??
            .enabled,
        dependencyGraphAutosubmitAction:
            CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitAction.maybeFromJson(
              json['dependency_graph_autosubmit_action'] as String?,
            ) ??
            .disabled,
        dependencyGraphAutosubmitActionOptions:
            CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitActionOptions.maybeFromJson(
              json['dependency_graph_autosubmit_action_options']
                  as Map<String, dynamic>?,
            ),
        dependabotAlerts:
            CodeSecurityCreateConfigurationForEnterpriseRequestDependabotAlerts.maybeFromJson(
              json['dependabot_alerts'] as String?,
            ) ??
            .disabled,
        dependabotSecurityUpdates:
            CodeSecurityCreateConfigurationForEnterpriseRequestDependabotSecurityUpdates.maybeFromJson(
              json['dependabot_security_updates'] as String?,
            ) ??
            .disabled,
        codeScanningDefaultSetup:
            CodeSecurityCreateConfigurationForEnterpriseRequestCodeScanningDefaultSetup.maybeFromJson(
              json['code_scanning_default_setup'] as String?,
            ) ??
            .disabled,
        codeScanningDefaultSetupOptions:
            CodeScanningDefaultSetupOptions.maybeFromJson(
              json['code_scanning_default_setup_options']
                  as Map<String, dynamic>?,
            ),
        codeScanningDelegatedAlertDismissal:
            CodeSecurityCreateConfigurationForEnterpriseRequestCodeScanningDelegatedAlertDismissal.maybeFromJson(
              json['code_scanning_delegated_alert_dismissal'] as String?,
            ) ??
            .disabled,
        secretScanning:
            CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanning.maybeFromJson(
              json['secret_scanning'] as String?,
            ) ??
            .disabled,
        secretScanningPushProtection:
            CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningPushProtection.maybeFromJson(
              json['secret_scanning_push_protection'] as String?,
            ) ??
            .disabled,
        secretScanningValidityChecks:
            CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningValidityChecks.maybeFromJson(
              json['secret_scanning_validity_checks'] as String?,
            ) ??
            .disabled,
        secretScanningNonProviderPatterns:
            CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningNonProviderPatterns.maybeFromJson(
              json['secret_scanning_non_provider_patterns'] as String?,
            ) ??
            .disabled,
        secretScanningGenericSecrets:
            CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningGenericSecrets.maybeFromJson(
              json['secret_scanning_generic_secrets'] as String?,
            ) ??
            .disabled,
        secretScanningDelegatedAlertDismissal:
            CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningDelegatedAlertDismissal.maybeFromJson(
              json['secret_scanning_delegated_alert_dismissal'] as String?,
            ) ??
            .disabled,
        privateVulnerabilityReporting:
            CodeSecurityCreateConfigurationForEnterpriseRequestPrivateVulnerabilityReporting.maybeFromJson(
              json['private_vulnerability_reporting'] as String?,
            ) ??
            .disabled,
        enforcement:
            CodeSecurityCreateConfigurationForEnterpriseRequestEnforcement.maybeFromJson(
              json['enforcement'] as String?,
            ) ??
            .enforced,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityCreateConfigurationForEnterpriseRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityCreateConfigurationForEnterpriseRequest.fromJson(json);
  }

  /// The name of the code security configuration. Must be unique within the
  /// enterprise.
  final String name;

  /// A description of the code security configuration
  final String description;

  /// The enablement status of GitHub Advanced Security features. `enabled`
  /// will enable both Code Security and Secret Protection features.
  final CodeSecurityCreateConfigurationForEnterpriseRequestAdvancedSecurity
  advancedSecurity;

  /// The enablement status of Dependency Graph
  final CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraph
  dependencyGraph;

  /// The enablement status of Automatic dependency submission
  final CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitAction
  dependencyGraphAutosubmitAction;

  /// Feature options for Automatic dependency submission
  final CodeSecurityCreateConfigurationForEnterpriseRequestDependencyGraphAutosubmitActionOptions?
  dependencyGraphAutosubmitActionOptions;

  /// The enablement status of Dependabot alerts
  final CodeSecurityCreateConfigurationForEnterpriseRequestDependabotAlerts
  dependabotAlerts;

  /// The enablement status of Dependabot security updates
  final CodeSecurityCreateConfigurationForEnterpriseRequestDependabotSecurityUpdates
  dependabotSecurityUpdates;

  /// The enablement status of code scanning default setup
  final CodeSecurityCreateConfigurationForEnterpriseRequestCodeScanningDefaultSetup
  codeScanningDefaultSetup;

  /// Feature options for code scanning default setup
  final CodeScanningDefaultSetupOptions? codeScanningDefaultSetupOptions;

  /// The enablement status of code scanning delegated alert dismissal
  final CodeSecurityCreateConfigurationForEnterpriseRequestCodeScanningDelegatedAlertDismissal
  codeScanningDelegatedAlertDismissal;

  /// The enablement status of secret scanning
  final CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanning
  secretScanning;

  /// The enablement status of secret scanning push protection
  final CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningPushProtection
  secretScanningPushProtection;

  /// The enablement status of secret scanning validity checks
  final CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningValidityChecks
  secretScanningValidityChecks;

  /// The enablement status of secret scanning non provider patterns
  final CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningNonProviderPatterns
  secretScanningNonProviderPatterns;

  /// The enablement status of Copilot secret scanning
  final CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningGenericSecrets
  secretScanningGenericSecrets;

  /// The enablement status of secret scanning delegated alert dismissal
  final CodeSecurityCreateConfigurationForEnterpriseRequestSecretScanningDelegatedAlertDismissal
  secretScanningDelegatedAlertDismissal;

  /// The enablement status of private vulnerability reporting
  final CodeSecurityCreateConfigurationForEnterpriseRequestPrivateVulnerabilityReporting
  privateVulnerabilityReporting;

  /// The enforcement status for a security configuration
  final CodeSecurityCreateConfigurationForEnterpriseRequestEnforcement
  enforcement;

  /// Converts a [CodeSecurityCreateConfigurationForEnterpriseRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'advanced_security': advancedSecurity.toJson(),
      'dependency_graph': dependencyGraph.toJson(),
      'dependency_graph_autosubmit_action': dependencyGraphAutosubmitAction
          .toJson(),
      'dependency_graph_autosubmit_action_options':
          ?dependencyGraphAutosubmitActionOptions?.toJson(),
      'dependabot_alerts': dependabotAlerts.toJson(),
      'dependabot_security_updates': dependabotSecurityUpdates.toJson(),
      'code_scanning_default_setup': codeScanningDefaultSetup.toJson(),
      'code_scanning_default_setup_options': codeScanningDefaultSetupOptions
          ?.toJson(),
      'code_scanning_delegated_alert_dismissal':
          codeScanningDelegatedAlertDismissal.toJson(),
      'secret_scanning': secretScanning.toJson(),
      'secret_scanning_push_protection': secretScanningPushProtection.toJson(),
      'secret_scanning_validity_checks': secretScanningValidityChecks.toJson(),
      'secret_scanning_non_provider_patterns': secretScanningNonProviderPatterns
          .toJson(),
      'secret_scanning_generic_secrets': secretScanningGenericSecrets.toJson(),
      'secret_scanning_delegated_alert_dismissal':
          secretScanningDelegatedAlertDismissal.toJson(),
      'private_vulnerability_reporting': privateVulnerabilityReporting.toJson(),
      'enforcement': enforcement.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
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
    secretScanningValidityChecks,
    secretScanningNonProviderPatterns,
    secretScanningGenericSecrets,
    secretScanningDelegatedAlertDismissal,
    privateVulnerabilityReporting,
    enforcement,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeSecurityCreateConfigurationForEnterpriseRequest &&
        name == other.name &&
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
        secretScanningValidityChecks == other.secretScanningValidityChecks &&
        secretScanningNonProviderPatterns ==
            other.secretScanningNonProviderPatterns &&
        secretScanningGenericSecrets == other.secretScanningGenericSecrets &&
        secretScanningDelegatedAlertDismissal ==
            other.secretScanningDelegatedAlertDismissal &&
        privateVulnerabilityReporting == other.privateVulnerabilityReporting &&
        enforcement == other.enforcement;
  }
}
