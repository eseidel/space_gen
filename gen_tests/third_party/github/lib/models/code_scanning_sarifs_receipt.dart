import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_analysis_sarif_id.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningSarifsReceipt {
  const CodeScanningSarifsReceipt({this.id, this.url});

  /// Converts a `Map<String, dynamic>` to a [CodeScanningSarifsReceipt].
  factory CodeScanningSarifsReceipt.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningSarifsReceipt',
      json,
      () => CodeScanningSarifsReceipt(
        id: CodeScanningAnalysisSarifId.maybeFromJson(json['id'] as String?),
        url: maybeParseUri(json['url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningSarifsReceipt? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningSarifsReceipt.fromJson(json);
  }

  /// An identifier for the upload.
  /// Example: `'6c81cd8e-b078-4ac3-a3be-1dad7dbd0b53'`
  final CodeScanningAnalysisSarifId? id;

  /// The REST API URL for checking the status of the upload.
  final Uri? url;

  /// Converts a [CodeScanningSarifsReceipt] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': ?id?.toJson(), 'url': ?url?.toString()};
  }

  @override
  int get hashCode => Object.hashAll([id, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningSarifsReceipt &&
        id == other.id &&
        url == other.url;
  }
}
