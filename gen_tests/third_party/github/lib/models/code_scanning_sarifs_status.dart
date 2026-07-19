import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_sarifs_status_processing_status.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningSarifsStatus {
  const CodeScanningSarifsStatus({
    this.processingStatus,
    this.analysesUrl,
    this.errors,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningSarifsStatus].
  factory CodeScanningSarifsStatus.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningSarifsStatus',
      json,
      () => CodeScanningSarifsStatus(
        processingStatus:
            CodeScanningSarifsStatusProcessingStatus.maybeFromJson(
              json['processing_status'] as String?,
            ),
        analysesUrl: maybeParseUri(json['analyses_url'] as String?),
        errors: (json['errors'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningSarifsStatus? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningSarifsStatus.fromJson(json);
  }

  /// `pending` files have not yet been processed, while `complete` means
  /// results from the SARIF have been stored. `failed` files have either not
  /// been processed at all, or could only be partially processed.
  final CodeScanningSarifsStatusProcessingStatus? processingStatus;

  /// The REST API URL for getting the analyses associated with the upload.
  final Uri? analysesUrl;

  /// Any errors that ocurred during processing of the delivery.
  final List<String>? errors;

  /// Converts a [CodeScanningSarifsStatus] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (processingStatus != null)
        'processing_status': processingStatus?.toJson(),
      'analyses_url': analysesUrl?.toString(),
      'errors': errors,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([processingStatus, analysesUrl, listHash(errors)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningSarifsStatus &&
        processingStatus == other.processingStatus &&
        analysesUrl == other.analysesUrl &&
        listsEqual(errors, other.errors);
  }
}
