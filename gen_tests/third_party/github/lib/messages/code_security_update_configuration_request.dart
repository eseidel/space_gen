// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_default_setup_options.dart';
import 'package:github/models/code_security_update_configuration_request_advanced_security.dart';
import 'package:github/models/code_security_update_configuration_request_code_scanning_default_setup.dart';
import 'package:github/models/code_security_update_configuration_request_code_scanning_delegated_alert_dismissal.dart';
import 'package:github/models/code_security_update_configuration_request_dependabot_alerts.dart';
import 'package:github/models/code_security_update_configuration_request_dependabot_security_updates.dart';
import 'package:github/models/code_security_update_configuration_request_dependency_graph.dart';
import 'package:github/models/code_security_update_configuration_request_dependency_graph_autosubmit_action.dart';
import 'package:github/models/code_security_update_configuration_request_dependency_graph_autosubmit_action_options.dart';
import 'package:github/models/code_security_update_configuration_request_enforcement.dart';
import 'package:github/models/code_security_update_configuration_request_private_vulnerability_reporting.dart';
import 'package:github/models/code_security_update_configuration_request_secret_scanning.dart';
import 'package:github/models/code_security_update_configuration_request_secret_scanning_delegated_alert_dismissal.dart';
import 'package:github/models/code_security_update_configuration_request_secret_scanning_delegated_bypass.dart';
import 'package:github/models/code_security_update_configuration_request_secret_scanning_delegated_bypass_options.dart';
import 'package:github/models/code_security_update_configuration_request_secret_scanning_generic_secrets.dart';
import 'package:github/models/code_security_update_configuration_request_secret_scanning_non_provider_patterns.dart';
import 'package:github/models/code_security_update_configuration_request_secret_scanning_push_protection.dart';
import 'package:github/models/code_security_update_configuration_request_secret_scanning_validity_checks.dart';
import 'package:meta/meta.dart';

@immutable
class CodeSecurityUpdateConfigurationRequest {
  const CodeSecurityUpdateConfigurationRequest({
    this.name,
    this.description,
    this.advancedSecurity,
    this.dependencyGraph,
    this.dependencyGraphAutosubmitAction,
    this.dependencyGraphAutosubmitActionOptions,
    this.dependabotAlerts,
    this.dependabotSecurityUpdates,
    this.codeScanningDefaultSetup,
    this.codeScanningDefaultSetupOptions,
    this.codeScanningDelegatedAlertDismissal = .disabled,
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
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityUpdateConfigurationRequest].
  factory CodeSecurityUpdateConfigurationRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityUpdateConfigurationRequest',
      json,
      () => CodeSecurityUpdateConfigurationRequest(
        name: json['name'] as String?,
        description: json['description'] as String?,
        advancedSecurity:
            CodeSecurityUpdateConfigurationRequestAdvancedSecurity.maybeFromJson(
              json['advanced_security'] as String?,
            ),
        dependencyGraph:
            CodeSecurityUpdateConfigurationRequestDependencyGraph.maybeFromJson(
              json['dependency_graph'] as String?,
            ),
        dependencyGraphAutosubmitAction:
            CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitAction.maybeFromJson(
              json['dependency_graph_autosubmit_action'] as String?,
            ),
        dependencyGraphAutosubmitActionOptions:
            CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitActionOptions.maybeFromJson(
              json['dependency_graph_autosubmit_action_options']
                  as Map<String, dynamic>?,
            ),
        dependabotAlerts:
            CodeSecurityUpdateConfigurationRequestDependabotAlerts.maybeFromJson(
              json['dependabot_alerts'] as String?,
            ),
        dependabotSecurityUpdates:
            CodeSecurityUpdateConfigurationRequestDependabotSecurityUpdates.maybeFromJson(
              json['dependabot_security_updates'] as String?,
            ),
        codeScanningDefaultSetup:
            CodeSecurityUpdateConfigurationRequestCodeScanningDefaultSetup.maybeFromJson(
              json['code_scanning_default_setup'] as String?,
            ),
        codeScanningDefaultSetupOptions:
            CodeScanningDefaultSetupOptions.maybeFromJson(
              json['code_scanning_default_setup_options']
                  as Map<String, dynamic>?,
            ),
        codeScanningDelegatedAlertDismissal:
            CodeSecurityUpdateConfigurationRequestCodeScanningDelegatedAlertDismissal.maybeFromJson(
              json['code_scanning_delegated_alert_dismissal'] as String?,
            ) ??
            .disabled,
        secretScanning:
            CodeSecurityUpdateConfigurationRequestSecretScanning.maybeFromJson(
              json['secret_scanning'] as String?,
            ),
        secretScanningPushProtection:
            CodeSecurityUpdateConfigurationRequestSecretScanningPushProtection.maybeFromJson(
              json['secret_scanning_push_protection'] as String?,
            ),
        secretScanningDelegatedBypass:
            CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedBypass.maybeFromJson(
              json['secret_scanning_delegated_bypass'] as String?,
            ),
        secretScanningDelegatedBypassOptions:
            CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedBypassOptions.maybeFromJson(
              json['secret_scanning_delegated_bypass_options']
                  as Map<String, dynamic>?,
            ),
        secretScanningValidityChecks:
            CodeSecurityUpdateConfigurationRequestSecretScanningValidityChecks.maybeFromJson(
              json['secret_scanning_validity_checks'] as String?,
            ),
        secretScanningNonProviderPatterns:
            CodeSecurityUpdateConfigurationRequestSecretScanningNonProviderPatterns.maybeFromJson(
              json['secret_scanning_non_provider_patterns'] as String?,
            ),
        secretScanningGenericSecrets:
            CodeSecurityUpdateConfigurationRequestSecretScanningGenericSecrets.maybeFromJson(
              json['secret_scanning_generic_secrets'] as String?,
            ),
        secretScanningDelegatedAlertDismissal:
            CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedAlertDismissal.maybeFromJson(
              json['secret_scanning_delegated_alert_dismissal'] as String?,
            ),
        privateVulnerabilityReporting:
            CodeSecurityUpdateConfigurationRequestPrivateVulnerabilityReporting.maybeFromJson(
              json['private_vulnerability_reporting'] as String?,
            ),
        enforcement:
            CodeSecurityUpdateConfigurationRequestEnforcement.maybeFromJson(
              json['enforcement'] as String?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityUpdateConfigurationRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeSecurityUpdateConfigurationRequest.fromJson(json);
  }

  /// The name of the code security configuration. Must be unique within the
  /// organization.
  final String? name;

  /// A description of the code security configuration
  final String? description;

  /// The enablement status of GitHub Advanced Security features. `enabled`
  /// will enable both Code Security and Secret Protection features.
  final CodeSecurityUpdateConfigurationRequestAdvancedSecurity?
  advancedSecurity;

  /// The enablement status of Dependency Graph
  final CodeSecurityUpdateConfigurationRequestDependencyGraph? dependencyGraph;

  /// The enablement status of Automatic dependency submission
  final CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitAction?
  dependencyGraphAutosubmitAction;

  /// Feature options for Automatic dependency submission
  final CodeSecurityUpdateConfigurationRequestDependencyGraphAutosubmitActionOptions?
  dependencyGraphAutosubmitActionOptions;

  /// The enablement status of Dependabot alerts
  final CodeSecurityUpdateConfigurationRequestDependabotAlerts?
  dependabotAlerts;

  /// The enablement status of Dependabot security updates
  final CodeSecurityUpdateConfigurationRequestDependabotSecurityUpdates?
  dependabotSecurityUpdates;

  /// The enablement status of code scanning default setup
  final CodeSecurityUpdateConfigurationRequestCodeScanningDefaultSetup?
  codeScanningDefaultSetup;

  /// Feature options for code scanning default setup
  final CodeScanningDefaultSetupOptions? codeScanningDefaultSetupOptions;

  /// The enablement status of code scanning delegated alert dismissal
  final CodeSecurityUpdateConfigurationRequestCodeScanningDelegatedAlertDismissal
  codeScanningDelegatedAlertDismissal;

  /// The enablement status of secret scanning
  final CodeSecurityUpdateConfigurationRequestSecretScanning? secretScanning;

  /// The enablement status of secret scanning push protection
  final CodeSecurityUpdateConfigurationRequestSecretScanningPushProtection?
  secretScanningPushProtection;

  /// The enablement status of secret scanning delegated bypass
  final CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedBypass?
  secretScanningDelegatedBypass;

  /// Feature options for secret scanning delegated bypass
  final CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedBypassOptions?
  secretScanningDelegatedBypassOptions;

  /// The enablement status of secret scanning validity checks
  final CodeSecurityUpdateConfigurationRequestSecretScanningValidityChecks?
  secretScanningValidityChecks;

  /// The enablement status of secret scanning non-provider patterns
  final CodeSecurityUpdateConfigurationRequestSecretScanningNonProviderPatterns?
  secretScanningNonProviderPatterns;

  /// The enablement status of Copilot secret scanning
  final CodeSecurityUpdateConfigurationRequestSecretScanningGenericSecrets?
  secretScanningGenericSecrets;

  /// The enablement status of secret scanning delegated alert dismissal
  final CodeSecurityUpdateConfigurationRequestSecretScanningDelegatedAlertDismissal?
  secretScanningDelegatedAlertDismissal;

  /// The enablement status of private vulnerability reporting
  final CodeSecurityUpdateConfigurationRequestPrivateVulnerabilityReporting?
  privateVulnerabilityReporting;

  /// The enforcement status for a security configuration
  final CodeSecurityUpdateConfigurationRequestEnforcement? enforcement;

  /// Converts a [CodeSecurityUpdateConfigurationRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': ?name,
      'description': ?description,
      'advanced_security': ?advancedSecurity?.toJson(),
      'dependency_graph': ?dependencyGraph?.toJson(),
      'dependency_graph_autosubmit_action': ?dependencyGraphAutosubmitAction
          ?.toJson(),
      'dependency_graph_autosubmit_action_options':
          ?dependencyGraphAutosubmitActionOptions?.toJson(),
      'dependabot_alerts': ?dependabotAlerts?.toJson(),
      'dependabot_security_updates': ?dependabotSecurityUpdates?.toJson(),
      'code_scanning_default_setup': ?codeScanningDefaultSetup?.toJson(),
      'code_scanning_default_setup_options': codeScanningDefaultSetupOptions
          ?.toJson(),
      'code_scanning_delegated_alert_dismissal':
          codeScanningDelegatedAlertDismissal.toJson(),
      'secret_scanning': ?secretScanning?.toJson(),
      'secret_scanning_push_protection': ?secretScanningPushProtection
          ?.toJson(),
      'secret_scanning_delegated_bypass': ?secretScanningDelegatedBypass
          ?.toJson(),
      'secret_scanning_delegated_bypass_options':
          ?secretScanningDelegatedBypassOptions?.toJson(),
      'secret_scanning_validity_checks': ?secretScanningValidityChecks
          ?.toJson(),
      'secret_scanning_non_provider_patterns':
          ?secretScanningNonProviderPatterns?.toJson(),
      'secret_scanning_generic_secrets': ?secretScanningGenericSecrets
          ?.toJson(),
      'secret_scanning_delegated_alert_dismissal':
          ?secretScanningDelegatedAlertDismissal?.toJson(),
      'private_vulnerability_reporting': ?privateVulnerabilityReporting
          ?.toJson(),
      'enforcement': ?enforcement?.toJson(),
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
    return other is CodeSecurityUpdateConfigurationRequest &&
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
