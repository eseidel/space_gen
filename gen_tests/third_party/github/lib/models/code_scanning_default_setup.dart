import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_default_setup_languages_inner.dart';
import 'package:github/models/code_scanning_default_setup_query_suite.dart';
import 'package:github/models/code_scanning_default_setup_runner_type.dart';
import 'package:github/models/code_scanning_default_setup_schedule.dart';
import 'package:github/models/code_scanning_default_setup_state.dart';
import 'package:github/models/code_scanning_default_setup_threat_model.dart';
import 'package:meta/meta.dart';

/// {@template code_scanning_default_setup}
/// Configuration for code scanning default setup.
/// {@endtemplate}
@immutable
class CodeScanningDefaultSetup {
  /// {@macro code_scanning_default_setup}
  const CodeScanningDefaultSetup({
    this.state,
    this.languages,
    this.runnerType,
    this.runnerLabel,
    this.querySuite,
    this.threatModel,
    this.updatedAt,
    this.schedule,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningDefaultSetup].
  factory CodeScanningDefaultSetup.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningDefaultSetup',
      json,
      () => CodeScanningDefaultSetup(
        state: CodeScanningDefaultSetupState.maybeFromJson(
          json['state'] as String?,
        ),
        languages: (json['languages'] as List?)
            ?.map<CodeScanningDefaultSetupLanguagesInner>(
              (e) =>
                  CodeScanningDefaultSetupLanguagesInner.fromJson(e as String),
            )
            .toList(),
        runnerType: CodeScanningDefaultSetupRunnerType.maybeFromJson(
          json['runner_type'] as String?,
        ),
        runnerLabel: json['runner_label'] as String?,
        querySuite: CodeScanningDefaultSetupQuerySuite.maybeFromJson(
          json['query_suite'] as String?,
        ),
        threatModel: CodeScanningDefaultSetupThreatModel.maybeFromJson(
          json['threat_model'] as String?,
        ),
        updatedAt: maybeParseDateTime(json['updated_at'] as String?),
        schedule: CodeScanningDefaultSetupSchedule.maybeFromJson(
          json['schedule'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetup? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetup.fromJson(json);
  }

  /// Code scanning default setup has been configured or not.
  final CodeScanningDefaultSetupState? state;

  /// Languages to be analyzed.
  final List<CodeScanningDefaultSetupLanguagesInner>? languages;

  /// Runner type to be used.
  final CodeScanningDefaultSetupRunnerType? runnerType;

  /// Runner label to be used if the runner type is labeled.
  /// Example: `'code-scanning'`
  final String? runnerLabel;

  /// CodeQL query suite to be used.
  final CodeScanningDefaultSetupQuerySuite? querySuite;

  /// Threat model to be used for code scanning analysis. Use `remote` to
  /// analyze only network sources and `remote_and_local` to include local
  /// sources like filesystem access, command-line arguments, database reads,
  /// environment variable and standard input.
  final CodeScanningDefaultSetupThreatModel? threatModel;

  /// Timestamp of latest configuration update.
  /// Example: `'2023-12-06T14:20:20.000Z'`
  final DateTime? updatedAt;

  /// The frequency of the periodic analysis.
  final CodeScanningDefaultSetupSchedule? schedule;

  /// Converts a [CodeScanningDefaultSetup] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (state != null) 'state': state?.toJson(),
      if (languages != null)
        'languages': languages?.map((e) => e.toJson()).toList(),
      'runner_type': runnerType?.toJson(),
      'runner_label': runnerLabel,
      if (querySuite != null) 'query_suite': querySuite?.toJson(),
      if (threatModel != null) 'threat_model': threatModel?.toJson(),
      'updated_at': updatedAt?.toIso8601String(),
      'schedule': schedule?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    state,
    listHash(languages),
    runnerType,
    runnerLabel,
    querySuite,
    threatModel,
    updatedAt,
    schedule,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningDefaultSetup &&
        state == other.state &&
        listsEqual(languages, other.languages) &&
        runnerType == other.runnerType &&
        runnerLabel == other.runnerLabel &&
        querySuite == other.querySuite &&
        threatModel == other.threatModel &&
        updatedAt == other.updatedAt &&
        schedule == other.schedule;
  }
}
