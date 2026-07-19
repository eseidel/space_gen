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
