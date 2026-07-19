import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_alert_classification.dart';
import 'package:github/models/code_scanning_alert_environment.dart';
import 'package:github/models/code_scanning_alert_instance_message.dart';
import 'package:github/models/code_scanning_alert_location.dart';
import 'package:github/models/code_scanning_alert_state.dart';
import 'package:github/models/code_scanning_analysis_analysis_key.dart';
import 'package:github/models/code_scanning_analysis_category.dart';
import 'package:github/models/code_scanning_ref.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningAlertInstance {
  const CodeScanningAlertInstance({
    this.ref,
    this.analysisKey,
    this.environment,
    this.category,
    this.state,
    this.commitSha,
    this.message,
    this.location,
    this.htmlUrl,
    this.classifications,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningAlertInstance].
  factory CodeScanningAlertInstance.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningAlertInstance',
      json,
      () => CodeScanningAlertInstance(
        ref: CodeScanningRef.maybeFromJson(json['ref'] as String?),
        analysisKey: CodeScanningAnalysisAnalysisKey.maybeFromJson(
          json['analysis_key'] as String?,
        ),
        environment: CodeScanningAlertEnvironment.maybeFromJson(
          json['environment'] as String?,
        ),
        category: CodeScanningAnalysisCategory.maybeFromJson(
          json['category'] as String?,
        ),
        state: CodeScanningAlertState.maybeFromJson(json['state'] as String?),
        commitSha: json['commit_sha'] as String?,
        message: CodeScanningAlertInstanceMessage.maybeFromJson(
          json['message'] as Map<String, dynamic>?,
        ),
        location: CodeScanningAlertLocation.maybeFromJson(
          json['location'] as Map<String, dynamic>?,
        ),
        htmlUrl: json['html_url'] as String?,
        classifications: (json['classifications'] as List?)
            ?.map<CodeScanningAlertClassification>(
              (e) => CodeScanningAlertClassification.fromJson(e as String),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAlertInstance? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertInstance.fromJson(json);
  }

  /// The Git reference, formatted as `refs/pull/<number>/merge`,
  /// `refs/pull/<number>/head`,
  /// `refs/heads/<branch name>` or simply `<branch name>`.
  final CodeScanningRef? ref;

  /// Identifies the configuration under which the analysis was executed. For
  /// example, in GitHub Actions this includes the workflow filename and job
  /// name.
  final CodeScanningAnalysisAnalysisKey? analysisKey;

  /// Identifies the variable values associated with the environment in which
  /// the analysis that generated this alert instance was performed, such as
  /// the language that was analyzed.
  final CodeScanningAlertEnvironment? environment;

  /// Identifies the configuration under which the analysis was executed. Used
  /// to distinguish between multiple analyses for the same tool and commit,
  /// but performed on different languages or different parts of the code.
  final CodeScanningAnalysisCategory? category;

  /// State of a code scanning alert.
  final CodeScanningAlertState? state;
  final String? commitSha;
  final CodeScanningAlertInstanceMessage? message;

  /// Describe a region within a file for the alert.
  final CodeScanningAlertLocation? location;
  final String? htmlUrl;

  /// Classifications that have been applied to the file that triggered the
  /// alert.
  /// For example identifying it as documentation, or a generated file.
  final List<CodeScanningAlertClassification>? classifications;

  /// Converts a [CodeScanningAlertInstance] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'ref': ref?.toJson(),
      'analysis_key': analysisKey?.toJson(),
      'environment': environment?.toJson(),
      'category': category?.toJson(),
      'state': state?.toJson(),
      'commit_sha': commitSha,
      'message': message?.toJson(),
      'location': location?.toJson(),
      'html_url': htmlUrl,
      'classifications': classifications?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    ref,
    analysisKey,
    environment,
    category,
    state,
    commitSha,
    message,
    location,
    htmlUrl,
    listHash(classifications),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningAlertInstance &&
        ref == other.ref &&
        analysisKey == other.analysisKey &&
        environment == other.environment &&
        category == other.category &&
        state == other.state &&
        commitSha == other.commitSha &&
        message == other.message &&
        location == other.location &&
        htmlUrl == other.htmlUrl &&
        listsEqual(classifications, other.classifications);
  }
}
