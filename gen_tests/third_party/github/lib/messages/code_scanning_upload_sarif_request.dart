// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_analysis_commit_sha.dart';
import 'package:github/models/code_scanning_analysis_sarif_file.dart';
import 'package:github/models/code_scanning_ref_full.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningUploadSarifRequest {
  const CodeScanningUploadSarifRequest({
    required this.commitSha,
    required this.ref,
    required this.sarif,
    this.checkoutUri,
    this.startedAt,
    this.toolName,
    this.validate,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningUploadSarifRequest].
  factory CodeScanningUploadSarifRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningUploadSarifRequest',
      json,
      () => CodeScanningUploadSarifRequest(
        commitSha: CodeScanningAnalysisCommitSha.fromJson(
          json['commit_sha'] as String,
        ),
        ref: CodeScanningRefFull.fromJson(json['ref'] as String),
        sarif: CodeScanningAnalysisSarifFile.fromJson(json['sarif'] as String),
        checkoutUri: maybeParseUri(json['checkout_uri'] as String?),
        startedAt: maybeParseDateTime(json['started_at'] as String?),
        toolName: json['tool_name'] as String?,
        validate: json['validate'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningUploadSarifRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningUploadSarifRequest.fromJson(json);
  }

  /// The SHA of the commit to which the analysis you are uploading relates.
  final CodeScanningAnalysisCommitSha commitSha;

  /// The full Git reference, formatted as `refs/heads/<branch name>`,
  /// `refs/tags/<tag>`, `refs/pull/<number>/merge`, or
  /// `refs/pull/<number>/head`.
  /// Example: `'refs/heads/main'`
  final CodeScanningRefFull ref;

  /// A Base64 string representing the SARIF file to upload. You must first
  /// compress your SARIF file using
  /// [`gzip`](http://www.gnu.org/software/gzip/manual/gzip.html) and then
  /// translate the contents of the file into a Base64 encoding string. For
  /// more information, see "[SARIF support for code
  /// scanning](https://docs.github.com/code-security/secure-coding/sarif-support-for-code-scanning)."
  final CodeScanningAnalysisSarifFile sarif;

  /// The base directory used in the analysis, as it appears in the SARIF
  /// file.
  /// This property is used to convert file paths from absolute to relative,
  /// so that alerts can be mapped to their correct location in the
  /// repository.
  /// Example: `'file:///github/workspace/'`
  final Uri? checkoutUri;

  /// The time that the analysis run began. This is a timestamp in [ISO
  /// 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? startedAt;

  /// The name of the tool used to generate the code scanning analysis. If
  /// this parameter is not used, the tool name defaults to "API". If the
  /// uploaded SARIF contains a tool GUID, this will be available for
  /// filtering using the `tool_guid` parameter of operations such as `GET /repos/{owner}/{repo}/code-scanning/alerts`.
  final String? toolName;

  /// Whether the SARIF file will be validated according to the code scanning
  /// specifications.
  /// This parameter is intended to help integrators ensure that the uploaded
  /// SARIF files are correctly rendered by code scanning.
  final bool? validate;

  /// Converts a [CodeScanningUploadSarifRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'commit_sha': commitSha.toJson(),
      'ref': ref.toJson(),
      'sarif': sarif.toJson(),
      if (checkoutUri != null) 'checkout_uri': checkoutUri?.toString(),
      if (startedAt != null) 'started_at': startedAt?.toIso8601String(),
      if (toolName != null) 'tool_name': toolName,
      if (validate != null) 'validate': validate,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    commitSha,
    ref,
    sarif,
    checkoutUri,
    startedAt,
    toolName,
    validate,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningUploadSarifRequest &&
        commitSha == other.commitSha &&
        ref == other.ref &&
        sarif == other.sarif &&
        checkoutUri == other.checkoutUri &&
        startedAt == other.startedAt &&
        toolName == other.toolName &&
        validate == other.validate;
  }
}
