import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_default_setup_options_runner_type.dart';
import 'package:meta/meta.dart';

/// {@template code_scanning_default_setup_options}
/// Feature options for code scanning default setup
/// {@endtemplate}
@immutable
class CodeScanningDefaultSetupOptions {
  /// {@macro code_scanning_default_setup_options}
  const CodeScanningDefaultSetupOptions({this.runnerType, this.runnerLabel});

  /// Converts a `Map<String, dynamic>` to a [CodeScanningDefaultSetupOptions].
  factory CodeScanningDefaultSetupOptions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningDefaultSetupOptions',
      json,
      () => CodeScanningDefaultSetupOptions(
        runnerType: CodeScanningDefaultSetupOptionsRunnerType.maybeFromJson(
          json['runner_type'] as String?,
        ),
        runnerLabel: json['runner_label'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetupOptions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetupOptions.fromJson(json);
  }

  /// Whether to use labeled runners or standard GitHub runners.
  final CodeScanningDefaultSetupOptionsRunnerType? runnerType;

  /// The label of the runner to use for code scanning default setup when
  /// runner_type is 'labeled'.
  final String? runnerLabel;

  /// Converts a [CodeScanningDefaultSetupOptions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'runner_type': ?runnerType?.toJson(), 'runner_label': runnerLabel};
  }

  @override
  int get hashCode => Object.hashAll([runnerType, runnerLabel]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningDefaultSetupOptions &&
        runnerType == other.runnerType &&
        runnerLabel == other.runnerLabel;
  }
}
