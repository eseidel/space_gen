// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repos_update_request_security_and_analysis_advanced_security.dart';
import 'package:github/models/repos_update_request_security_and_analysis_code_security.dart';
import 'package:github/models/repos_update_request_security_and_analysis_secret_scanning.dart';
import 'package:github/models/repos_update_request_security_and_analysis_secret_scanning_ai_detection.dart';
import 'package:github/models/repos_update_request_security_and_analysis_secret_scanning_non_provider_patterns.dart';
import 'package:github/models/repos_update_request_security_and_analysis_secret_scanning_push_protection.dart';
import 'package:meta/meta.dart';

/// {@template repos_update_request_security_and_analysis}
/// Specify which security and analysis features to enable or disable for the
/// repository.
///
/// To use this parameter, you must have admin permissions for the repository or
/// be an owner or security manager for the organization that owns the
/// repository. For more information, see "[Managing security managers in your
/// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
///
/// For example, to enable GitHub Advanced Security, use this data in the body
/// of the `PATCH` request:
/// `{ "security_and_analysis": {"advanced_security": { "status": "enabled" } } }`.
///
/// You can check which security and analysis features are currently enabled by
/// using a `GET /repos/{owner}/{repo}` request.
/// {@endtemplate}
@immutable
class ReposUpdateRequestSecurityAndAnalysis {
  /// {@macro repos_update_request_security_and_analysis}
  const ReposUpdateRequestSecurityAndAnalysis({
    this.advancedSecurity,
    this.codeSecurity,
    this.secretScanning,
    this.secretScanningPushProtection,
    this.secretScanningAiDetection,
    this.secretScanningNonProviderPatterns,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdateRequestSecurityAndAnalysis].
  factory ReposUpdateRequestSecurityAndAnalysis.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdateRequestSecurityAndAnalysis',
      json,
      () => ReposUpdateRequestSecurityAndAnalysis(
        advancedSecurity:
            ReposUpdateRequestSecurityAndAnalysisAdvancedSecurity.maybeFromJson(
              json['advanced_security'] as Map<String, dynamic>?,
            ),
        codeSecurity:
            ReposUpdateRequestSecurityAndAnalysisCodeSecurity.maybeFromJson(
              json['code_security'] as Map<String, dynamic>?,
            ),
        secretScanning:
            ReposUpdateRequestSecurityAndAnalysisSecretScanning.maybeFromJson(
              json['secret_scanning'] as Map<String, dynamic>?,
            ),
        secretScanningPushProtection:
            ReposUpdateRequestSecurityAndAnalysisSecretScanningPushProtection.maybeFromJson(
              json['secret_scanning_push_protection'] as Map<String, dynamic>?,
            ),
        secretScanningAiDetection:
            ReposUpdateRequestSecurityAndAnalysisSecretScanningAiDetection.maybeFromJson(
              json['secret_scanning_ai_detection'] as Map<String, dynamic>?,
            ),
        secretScanningNonProviderPatterns:
            ReposUpdateRequestSecurityAndAnalysisSecretScanningNonProviderPatterns.maybeFromJson(
              json['secret_scanning_non_provider_patterns']
                  as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateRequestSecurityAndAnalysis? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateRequestSecurityAndAnalysis.fromJson(json);
  }

  /// Use the `status` property to enable or disable GitHub Advanced Security
  /// for this repository. For more information, see "[About GitHub Advanced
  /// Security](/github/getting-started-with-github/learning-about-github/about-github-advanced-security)."
  final ReposUpdateRequestSecurityAndAnalysisAdvancedSecurity? advancedSecurity;

  /// Use the `status` property to enable or disable GitHub Code Security for
  /// this repository.
  final ReposUpdateRequestSecurityAndAnalysisCodeSecurity? codeSecurity;

  /// Use the `status` property to enable or disable secret scanning for this
  /// repository. For more information, see "[About secret
  /// scanning](/code-security/secret-security/about-secret-scanning)."
  final ReposUpdateRequestSecurityAndAnalysisSecretScanning? secretScanning;

  /// Use the `status` property to enable or disable secret scanning push
  /// protection for this repository. For more information, see "[Protecting
  /// pushes with secret
  /// scanning](/code-security/secret-scanning/protecting-pushes-with-secret-scanning)."
  final ReposUpdateRequestSecurityAndAnalysisSecretScanningPushProtection?
  secretScanningPushProtection;

  /// Use the `status` property to enable or disable secret scanning AI
  /// detection for this repository. For more information, see "[Responsible
  /// detection of generic secrets with
  /// AI](https://docs.github.com/code-security/secret-scanning/using-advanced-secret-scanning-and-push-protection-features/generic-secret-detection/responsible-ai-generic-secrets)."
  final ReposUpdateRequestSecurityAndAnalysisSecretScanningAiDetection?
  secretScanningAiDetection;

  /// Use the `status` property to enable or disable secret scanning
  /// non-provider patterns for this repository. For more information, see
  /// "[Supported secret scanning
  /// patterns](/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#supported-secrets)."
  final ReposUpdateRequestSecurityAndAnalysisSecretScanningNonProviderPatterns?
  secretScanningNonProviderPatterns;

  /// Converts a [ReposUpdateRequestSecurityAndAnalysis]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (advancedSecurity != null)
        'advanced_security': advancedSecurity?.toJson(),
      if (codeSecurity != null) 'code_security': codeSecurity?.toJson(),
      if (secretScanning != null) 'secret_scanning': secretScanning?.toJson(),
      if (secretScanningPushProtection != null)
        'secret_scanning_push_protection': secretScanningPushProtection
            ?.toJson(),
      if (secretScanningAiDetection != null)
        'secret_scanning_ai_detection': secretScanningAiDetection?.toJson(),
      if (secretScanningNonProviderPatterns != null)
        'secret_scanning_non_provider_patterns':
            secretScanningNonProviderPatterns?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    advancedSecurity,
    codeSecurity,
    secretScanning,
    secretScanningPushProtection,
    secretScanningAiDetection,
    secretScanningNonProviderPatterns,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateRequestSecurityAndAnalysis &&
        advancedSecurity == other.advancedSecurity &&
        codeSecurity == other.codeSecurity &&
        secretScanning == other.secretScanning &&
        secretScanningPushProtection == other.secretScanningPushProtection &&
        secretScanningAiDetection == other.secretScanningAiDetection &&
        secretScanningNonProviderPatterns ==
            other.secretScanningNonProviderPatterns;
  }
}
