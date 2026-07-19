import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_analysis_tool_guid.dart';
import 'package:github/models/code_scanning_analysis_tool_name.dart';
import 'package:github/models/code_scanning_analysis_tool_version.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningAnalysisTool {
  const CodeScanningAnalysisTool({this.name, this.version, this.guid});

  /// Converts a `Map<String, dynamic>` to a [CodeScanningAnalysisTool].
  factory CodeScanningAnalysisTool.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningAnalysisTool',
      json,
      () => CodeScanningAnalysisTool(
        name: CodeScanningAnalysisToolName.maybeFromJson(
          json['name'] as String?,
        ),
        version: CodeScanningAnalysisToolVersion.maybeFromJson(
          json['version'] as String?,
        ),
        guid: CodeScanningAnalysisToolGuid.maybeFromJson(
          json['guid'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisTool? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisTool.fromJson(json);
  }

  /// The name of the tool used to generate the code scanning analysis.
  final CodeScanningAnalysisToolName? name;

  /// The version of the tool used to generate the code scanning analysis.
  final CodeScanningAnalysisToolVersion? version;

  /// The GUID of the tool used to generate the code scanning analysis, if
  /// provided in the uploaded SARIF data.
  final CodeScanningAnalysisToolGuid? guid;

  /// Converts a [CodeScanningAnalysisTool] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name?.toJson(),
      'version': version?.toJson(),
      'guid': guid?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, version, guid]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningAnalysisTool &&
        name == other.name &&
        version == other.version &&
        guid == other.guid;
  }
}
