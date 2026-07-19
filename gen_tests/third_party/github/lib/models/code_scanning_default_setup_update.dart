import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_default_setup_update_languages_inner.dart';
import 'package:github/models/code_scanning_default_setup_update_query_suite.dart';
import 'package:github/models/code_scanning_default_setup_update_runner_type.dart';
import 'package:github/models/code_scanning_default_setup_update_state.dart';
import 'package:github/models/code_scanning_default_setup_update_threat_model.dart';
import 'package:meta/meta.dart';

/// {@template code_scanning_default_setup_update}
/// Configuration for code scanning default setup.
/// {@endtemplate}
@immutable
class CodeScanningDefaultSetupUpdate {
  /// {@macro code_scanning_default_setup_update}
  const CodeScanningDefaultSetupUpdate({
    this.state,
    this.runnerType,
    this.runnerLabel,
    this.querySuite,
    this.threatModel,
    this.languages,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningDefaultSetupUpdate].
  factory CodeScanningDefaultSetupUpdate.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningDefaultSetupUpdate',
      json,
      () => CodeScanningDefaultSetupUpdate(
        state: CodeScanningDefaultSetupUpdateState.maybeFromJson(
          json['state'] as String?,
        ),
        runnerType: CodeScanningDefaultSetupUpdateRunnerType.maybeFromJson(
          json['runner_type'] as String?,
        ),
        runnerLabel: json['runner_label'] as String?,
        querySuite: CodeScanningDefaultSetupUpdateQuerySuite.maybeFromJson(
          json['query_suite'] as String?,
        ),
        threatModel: CodeScanningDefaultSetupUpdateThreatModel.maybeFromJson(
          json['threat_model'] as String?,
        ),
        languages: (json['languages'] as List?)
            ?.map<CodeScanningDefaultSetupUpdateLanguagesInner>(
              (e) => CodeScanningDefaultSetupUpdateLanguagesInner.fromJson(
                e as String,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetupUpdate? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetupUpdate.fromJson(json);
  }

  /// The desired state of code scanning default setup.
  final CodeScanningDefaultSetupUpdateState? state;

  /// Runner type to be used.
  final CodeScanningDefaultSetupUpdateRunnerType? runnerType;

  /// Runner label to be used if the runner type is labeled.
  /// Example: `'code-scanning'`
  final String? runnerLabel;

  /// CodeQL query suite to be used.
  final CodeScanningDefaultSetupUpdateQuerySuite? querySuite;

  /// Threat model to be used for code scanning analysis. Use `remote` to
  /// analyze only network sources and `remote_and_local` to include local
  /// sources like filesystem access, command-line arguments, database reads,
  /// environment variable and standard input.
  final CodeScanningDefaultSetupUpdateThreatModel? threatModel;

  /// CodeQL languages to be analyzed.
  final List<CodeScanningDefaultSetupUpdateLanguagesInner>? languages;

  /// Converts a [CodeScanningDefaultSetupUpdate] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'state': ?state?.toJson(),
      'runner_type': ?runnerType?.toJson(),
      'runner_label': runnerLabel,
      'query_suite': ?querySuite?.toJson(),
      'threat_model': ?threatModel?.toJson(),
      'languages': ?languages?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    state,
    runnerType,
    runnerLabel,
    querySuite,
    threatModel,
    listHash(languages),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningDefaultSetupUpdate &&
        state == other.state &&
        runnerType == other.runnerType &&
        runnerLabel == other.runnerLabel &&
        querySuite == other.querySuite &&
        threatModel == other.threatModel &&
        listsEqual(languages, other.languages);
  }
}
