import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template code_scanning_default_setup_update_response}
/// You can use `run_url` to track the status of the run. This includes a
/// property status and conclusion.
/// You should not rely on this always being an actions workflow run object.
/// {@endtemplate}
@immutable
class CodeScanningDefaultSetupUpdateResponse {
  /// {@macro code_scanning_default_setup_update_response}
  const CodeScanningDefaultSetupUpdateResponse({this.runId, this.runUrl});

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeScanningDefaultSetupUpdateResponse].
  factory CodeScanningDefaultSetupUpdateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeScanningDefaultSetupUpdateResponse',
      json,
      () => CodeScanningDefaultSetupUpdateResponse(
        runId: json['run_id'] as int?,
        runUrl: json['run_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetupUpdateResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetupUpdateResponse.fromJson(json);
  }

  /// ID of the corresponding run.
  final int? runId;

  /// URL of the corresponding run.
  final String? runUrl;

  /// Converts a [CodeScanningDefaultSetupUpdateResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'run_id': ?runId, 'run_url': ?runUrl};
  }

  @override
  int get hashCode => Object.hashAll([runId, runUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningDefaultSetupUpdateResponse &&
        runId == other.runId &&
        runUrl == other.runUrl;
  }
}
