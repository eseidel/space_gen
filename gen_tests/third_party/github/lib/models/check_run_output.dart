// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CheckRunOutput {
  const CheckRunOutput({
    required this.title,
    required this.summary,
    required this.text,
    required this.annotationsCount,
    required this.annotationsUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [CheckRunOutput].
  factory CheckRunOutput.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CheckRunOutput',
      json,
      () => CheckRunOutput(
        title: checkedKey(json, 'title') as String?,
        summary: checkedKey(json, 'summary') as String?,
        text: checkedKey(json, 'text') as String?,
        annotationsCount: json['annotations_count'] as int,
        annotationsUrl: Uri.parse(json['annotations_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CheckRunOutput? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CheckRunOutput.fromJson(json);
  }

  final String? title;
  final String? summary;
  final String? text;
  final int annotationsCount;
  final Uri annotationsUrl;

  /// Converts a [CheckRunOutput] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'summary': summary,
      'text': text,
      'annotations_count': annotationsCount,
      'annotations_url': annotationsUrl.toString(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([title, summary, text, annotationsCount, annotationsUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckRunOutput &&
        title == other.title &&
        summary == other.summary &&
        text == other.text &&
        annotationsCount == other.annotationsCount &&
        annotationsUrl == other.annotationsUrl;
  }
}
