import 'package:github/model_helpers.dart';
import 'package:github/models/security_and_analysis_advanced_security.dart';
import 'package:github/models/security_and_analysis_code_security.dart';
import 'package:github/models/security_and_analysis_dependabot_security_updates.dart';
import 'package:github/models/security_and_analysis_secret_scanning.dart';
import 'package:github/models/security_and_analysis_secret_scanning_ai_detection.dart';
import 'package:github/models/security_and_analysis_secret_scanning_non_provider_patterns.dart';
import 'package:github/models/security_and_analysis_secret_scanning_push_protection.dart';
import 'package:meta/meta.dart';

@immutable
class SecurityAndAnalysis {
  const SecurityAndAnalysis({
    this.advancedSecurity,
    this.codeSecurity,
    this.dependabotSecurityUpdates,
    this.secretScanning,
    this.secretScanningPushProtection,
    this.secretScanningNonProviderPatterns,
    this.secretScanningAiDetection,
  });

  /// Converts a `Map<String, dynamic>` to a [SecurityAndAnalysis].
  factory SecurityAndAnalysis.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SecurityAndAnalysis',
      json,
      () => SecurityAndAnalysis(
        advancedSecurity: SecurityAndAnalysisAdvancedSecurity.maybeFromJson(
          json['advanced_security'] as Map<String, dynamic>?,
        ),
        codeSecurity: SecurityAndAnalysisCodeSecurity.maybeFromJson(
          json['code_security'] as Map<String, dynamic>?,
        ),
        dependabotSecurityUpdates:
            SecurityAndAnalysisDependabotSecurityUpdates.maybeFromJson(
              json['dependabot_security_updates'] as Map<String, dynamic>?,
            ),
        secretScanning: SecurityAndAnalysisSecretScanning.maybeFromJson(
          json['secret_scanning'] as Map<String, dynamic>?,
        ),
        secretScanningPushProtection:
            SecurityAndAnalysisSecretScanningPushProtection.maybeFromJson(
              json['secret_scanning_push_protection'] as Map<String, dynamic>?,
            ),
        secretScanningNonProviderPatterns:
            SecurityAndAnalysisSecretScanningNonProviderPatterns.maybeFromJson(
              json['secret_scanning_non_provider_patterns']
                  as Map<String, dynamic>?,
            ),
        secretScanningAiDetection:
            SecurityAndAnalysisSecretScanningAiDetection.maybeFromJson(
              json['secret_scanning_ai_detection'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecurityAndAnalysis? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SecurityAndAnalysis.fromJson(json);
  }

  final SecurityAndAnalysisAdvancedSecurity? advancedSecurity;
  final SecurityAndAnalysisCodeSecurity? codeSecurity;

  /// Enable or disable Dependabot security updates for the repository.
  final SecurityAndAnalysisDependabotSecurityUpdates? dependabotSecurityUpdates;
  final SecurityAndAnalysisSecretScanning? secretScanning;
  final SecurityAndAnalysisSecretScanningPushProtection?
  secretScanningPushProtection;
  final SecurityAndAnalysisSecretScanningNonProviderPatterns?
  secretScanningNonProviderPatterns;
  final SecurityAndAnalysisSecretScanningAiDetection? secretScanningAiDetection;

  /// Converts a [SecurityAndAnalysis] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'advanced_security': advancedSecurity?.toJson(),
      'code_security': codeSecurity?.toJson(),
      'dependabot_security_updates': dependabotSecurityUpdates?.toJson(),
      'secret_scanning': secretScanning?.toJson(),
      'secret_scanning_push_protection': secretScanningPushProtection?.toJson(),
      'secret_scanning_non_provider_patterns': secretScanningNonProviderPatterns
          ?.toJson(),
      'secret_scanning_ai_detection': secretScanningAiDetection?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    advancedSecurity,
    codeSecurity,
    dependabotSecurityUpdates,
    secretScanning,
    secretScanningPushProtection,
    secretScanningNonProviderPatterns,
    secretScanningAiDetection,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAndAnalysis &&
        advancedSecurity == other.advancedSecurity &&
        codeSecurity == other.codeSecurity &&
        dependabotSecurityUpdates == other.dependabotSecurityUpdates &&
        secretScanning == other.secretScanning &&
        secretScanningPushProtection == other.secretScanningPushProtection &&
        secretScanningNonProviderPatterns ==
            other.secretScanningNonProviderPatterns &&
        secretScanningAiDetection == other.secretScanningAiDetection;
  }
}
