// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/code_security_configuration_code_scanning_default_setup_options_runner_type.dart';
import 'package:meta/meta.dart';

/// {@template code_security_configuration_code_scanning_default_setup_options}
/// Feature options for code scanning default setup
/// {@endtemplate}
@immutable
class CodeSecurityConfigurationCodeScanningDefaultSetupOptions {
  /// {@macro code_security_configuration_code_scanning_default_setup_options}
  const CodeSecurityConfigurationCodeScanningDefaultSetupOptions({
    this.runnerType,
    this.runnerLabel,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeSecurityConfigurationCodeScanningDefaultSetupOptions].
  factory CodeSecurityConfigurationCodeScanningDefaultSetupOptions.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeSecurityConfigurationCodeScanningDefaultSetupOptions',
      json,
      () => CodeSecurityConfigurationCodeScanningDefaultSetupOptions(
        runnerType:
            CodeSecurityConfigurationCodeScanningDefaultSetupOptionsRunnerType.maybeFromJson(
              json['runner_type'] as String?,
            ),
        runnerLabel: json['runner_label'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityConfigurationCodeScanningDefaultSetupOptions?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityConfigurationCodeScanningDefaultSetupOptions.fromJson(
      json,
    );
  }

  /// Whether to use labeled runners or standard GitHub runners.
  final CodeSecurityConfigurationCodeScanningDefaultSetupOptionsRunnerType?
  runnerType;

  /// The label of the runner to use for code scanning when runner_type is
  /// 'labeled'.
  final String? runnerLabel;

  /// Converts a [CodeSecurityConfigurationCodeScanningDefaultSetupOptions]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'runner_type': runnerType?.toJson(), 'runner_label': runnerLabel};
  }

  @override
  int get hashCode => Object.hashAll([runnerType, runnerLabel]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeSecurityConfigurationCodeScanningDefaultSetupOptions &&
        runnerType == other.runnerType &&
        runnerLabel == other.runnerLabel;
  }
}
