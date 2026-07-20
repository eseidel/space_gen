// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_default_setup_options.dart';
import 'package:github/models/code_security_create_configuration_request_advanced_security.dart';
import 'package:github/models/code_security_create_configuration_request_code_scanning_default_setup.dart';
import 'package:github/models/code_security_create_configuration_request_code_scanning_delegated_alert_dismissal.dart';
import 'package:github/models/code_security_create_configuration_request_dependabot_alerts.dart';
import 'package:github/models/code_security_create_configuration_request_dependabot_security_updates.dart';
import 'package:github/models/code_security_create_configuration_request_dependency_graph.dart';
import 'package:github/models/code_security_create_configuration_request_dependency_graph_autosubmit_action.dart';
import 'package:github/models/code_security_create_configuration_request_dependency_graph_autosubmit_action_options.dart';
import 'package:github/models/code_security_create_configuration_request_enforcement.dart';
import 'package:github/models/code_security_create_configuration_request_private_vulnerability_reporting.dart';
import 'package:github/models/code_security_create_configuration_request_secret_scanning.dart';
import 'package:github/models/code_security_create_configuration_request_secret_scanning_delegated_alert_dismissal.dart';
import 'package:github/models/code_security_create_configuration_request_secret_scanning_delegated_bypass.dart';
import 'package:github/models/code_security_create_configuration_request_secret_scanning_delegated_bypass_options.dart';
import 'package:github/models/code_security_create_configuration_request_secret_scanning_generic_secrets.dart';
import 'package:github/models/code_security_create_configuration_request_secret_scanning_non_provider_patterns.dart';
import 'package:github/models/code_security_create_configuration_request_secret_scanning_push_protection.dart';
import 'package:github/models/code_security_create_configuration_request_secret_scanning_validity_checks.dart';
import 'package:meta/meta.dart';

@immutable
class CodeSecurityCreateConfigurationRequest {
  CodeSecurityCreateConfigurationRequest({
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
    this.codeScanningDelegatedAlertDismissal = .notSet,
    this.secretScanning = .disabled,
    this.secretScanningPushProtection = .disabled,
    this.secretScanningDelegatedBypass = .disabled,
    this.secretScanningDelegatedBypassOptions,
    this.secretScanningValidityChecks = .disabled,
    this.secretScanningNonProviderPatterns = .disabled,
    this.secretScanningGenericSecrets = .disabled,
    this.secretScanningDelegatedAlertDismissal,
    this.privateVulnerabilityReporting = .disabled,
    this.enforcement = .enforced,
  }) {
    description.validate(maxLength: 255);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityCreateConfigurationRequest].
  factory CodeSecurityCreateConfigurationRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityCreateConfigurationRequest',
      json,
      () => CodeSecurityCreateConfigurationRequest(
        name: json['name'] as String,
        description: json['description'] as String,
        advancedSecurity:
            CodeSecurityCreateConfigurationRequestAdvancedSecurity.maybeFromJson(
              json['advanced_security'] as String?,
            ) ??
            .disabled,
        dependencyGraph:
            CodeSecurityCreateConfigurationRequestDependencyGraph.maybeFromJson(
              json['dependency_graph'] as String?,
            ) ??
            .enabled,
        dependencyGraphAutosubmitAction:
            CodeSecurityCreateConfigurationRequestDependencyGraphAutosubmitAction.maybeFromJson(
              json['dependency_graph_autosubmit_action'] as String?,
            ) ??
            .disabled,
        dependencyGraphAutosubmitActionOptions:
            CodeSecurityCreateConfigurationRequestDependencyGraphAutosubmitActionOptions.maybeFromJson(
              json['dependency_graph_autosubmit_action_options']
                  as Map<String, dynamic>?,
            ),
        dependabotAlerts:
            CodeSecurityCreateConfigurationRequestDependabotAlerts.maybeFromJson(
              json['dependabot_alerts'] as String?,
            ) ??
            .disabled,
        dependabotSecurityUpdates:
            CodeSecurityCreateConfigurationRequestDependabotSecurityUpdates.maybeFromJson(
              json['dependabot_security_updates'] as String?,
            ) ??
            .disabled,
        codeScanningDefaultSetup:
            CodeSecurityCreateConfigurationRequestCodeScanningDefaultSetup.maybeFromJson(
              json['code_scanning_default_setup'] as String?,
            ) ??
            .disabled,
        codeScanningDefaultSetupOptions:
            CodeScanningDefaultSetupOptions.maybeFromJson(
              json['code_scanning_default_setup_options']
                  as Map<String, dynamic>?,
            ),
        codeScanningDelegatedAlertDismissal:
            CodeSecurityCreateConfigurationRequestCodeScanningDelegatedAlertDismissal.maybeFromJson(
              json['code_scanning_delegated_alert_dismissal'] as String?,
            ) ??
            .notSet,
        secretScanning:
            CodeSecurityCreateConfigurationRequestSecretScanning.maybeFromJson(
              json['secret_scanning'] as String?,
            ) ??
            .disabled,
        secretScanningPushProtection:
            CodeSecurityCreateConfigurationRequestSecretScanningPushProtection.maybeFromJson(
              json['secret_scanning_push_protection'] as String?,
            ) ??
            .disabled,
        secretScanningDelegatedBypass:
            CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypass.maybeFromJson(
              json['secret_scanning_delegated_bypass'] as String?,
            ) ??
            .disabled,
        secretScanningDelegatedBypassOptions:
            CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptions.maybeFromJson(
              json['secret_scanning_delegated_bypass_options']
                  as Map<String, dynamic>?,
            ),
        secretScanningValidityChecks:
            CodeSecurityCreateConfigurationRequestSecretScanningValidityChecks.maybeFromJson(
              json['secret_scanning_validity_checks'] as String?,
            ) ??
            .disabled,
        secretScanningNonProviderPatterns:
            CodeSecurityCreateConfigurationRequestSecretScanningNonProviderPatterns.maybeFromJson(
              json['secret_scanning_non_provider_patterns'] as String?,
            ) ??
            .disabled,
        secretScanningGenericSecrets:
            CodeSecurityCreateConfigurationRequestSecretScanningGenericSecrets.maybeFromJson(
              json['secret_scanning_generic_secrets'] as String?,
            ) ??
            .disabled,
        secretScanningDelegatedAlertDismissal:
            CodeSecurityCreateConfigurationRequestSecretScanningDelegatedAlertDismissal.maybeFromJson(
              json['secret_scanning_delegated_alert_dismissal'] as String?,
            ),
        privateVulnerabilityReporting:
            CodeSecurityCreateConfigurationRequestPrivateVulnerabilityReporting.maybeFromJson(
              json['private_vulnerability_reporting'] as String?,
            ) ??
            .disabled,
        enforcement:
            CodeSecurityCreateConfigurationRequestEnforcement.maybeFromJson(
              json['enforcement'] as String?,
            ) ??
            .enforced,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityCreateConfigurationRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityCreateConfigurationRequest.fromJson(json);
  }

  /// The name of the code security configuration. Must be unique within the
  /// organization.
  final String name;

  /// A description of the code security configuration
  final String description;

  /// The enablement status of GitHub Advanced Security features. `enabled`
  /// will enable both Code Security and Secret Protection features.
  final CodeSecurityCreateConfigurationRequestAdvancedSecurity advancedSecurity;

  /// The enablement status of Dependency Graph
  final CodeSecurityCreateConfigurationRequestDependencyGraph dependencyGraph;

  /// The enablement status of Automatic dependency submission
  final CodeSecurityCreateConfigurationRequestDependencyGraphAutosubmitAction
  dependencyGraphAutosubmitAction;

  /// Feature options for Automatic dependency submission
  final CodeSecurityCreateConfigurationRequestDependencyGraphAutosubmitActionOptions?
  dependencyGraphAutosubmitActionOptions;

  /// The enablement status of Dependabot alerts
  final CodeSecurityCreateConfigurationRequestDependabotAlerts dependabotAlerts;

  /// The enablement status of Dependabot security updates
  final CodeSecurityCreateConfigurationRequestDependabotSecurityUpdates
  dependabotSecurityUpdates;

  /// The enablement status of code scanning default setup
  final CodeSecurityCreateConfigurationRequestCodeScanningDefaultSetup
  codeScanningDefaultSetup;

  /// Feature options for code scanning default setup
  final CodeScanningDefaultSetupOptions? codeScanningDefaultSetupOptions;

  /// The enablement status of code scanning delegated alert dismissal
  final CodeSecurityCreateConfigurationRequestCodeScanningDelegatedAlertDismissal
  codeScanningDelegatedAlertDismissal;

  /// The enablement status of secret scanning
  final CodeSecurityCreateConfigurationRequestSecretScanning secretScanning;

  /// The enablement status of secret scanning push protection
  final CodeSecurityCreateConfigurationRequestSecretScanningPushProtection
  secretScanningPushProtection;

  /// The enablement status of secret scanning delegated bypass
  final CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypass
  secretScanningDelegatedBypass;

  /// Feature options for secret scanning delegated bypass
  final CodeSecurityCreateConfigurationRequestSecretScanningDelegatedBypassOptions?
  secretScanningDelegatedBypassOptions;

  /// The enablement status of secret scanning validity checks
  final CodeSecurityCreateConfigurationRequestSecretScanningValidityChecks
  secretScanningValidityChecks;

  /// The enablement status of secret scanning non provider patterns
  final CodeSecurityCreateConfigurationRequestSecretScanningNonProviderPatterns
  secretScanningNonProviderPatterns;

  /// The enablement status of Copilot secret scanning
  final CodeSecurityCreateConfigurationRequestSecretScanningGenericSecrets
  secretScanningGenericSecrets;

  /// The enablement status of secret scanning delegated alert dismissal
  final CodeSecurityCreateConfigurationRequestSecretScanningDelegatedAlertDismissal?
  secretScanningDelegatedAlertDismissal;

  /// The enablement status of private vulnerability reporting
  final CodeSecurityCreateConfigurationRequestPrivateVulnerabilityReporting
  privateVulnerabilityReporting;

  /// The enforcement status for a security configuration
  final CodeSecurityCreateConfigurationRequestEnforcement enforcement;

  /// Converts a [CodeSecurityCreateConfigurationRequest]
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
      'secret_scanning_delegated_bypass': secretScanningDelegatedBypass
          .toJson(),
      'secret_scanning_delegated_bypass_options':
          ?secretScanningDelegatedBypassOptions?.toJson(),
      'secret_scanning_validity_checks': secretScanningValidityChecks.toJson(),
      'secret_scanning_non_provider_patterns': secretScanningNonProviderPatterns
          .toJson(),
      'secret_scanning_generic_secrets': secretScanningGenericSecrets.toJson(),
      'secret_scanning_delegated_alert_dismissal':
          ?secretScanningDelegatedAlertDismissal?.toJson(),
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
    secretScanningDelegatedBypass,
    secretScanningDelegatedBypassOptions,
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
    return other is CodeSecurityCreateConfigurationRequest &&
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
        enforcement == other.enforcement;
  }
}
