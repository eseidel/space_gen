import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/checks_update_request_any_of_1_output_annotations_inner.dart';
import 'package:github/models/checks_update_request_any_of_1_output_images_inner.dart';
import 'package:meta/meta.dart';

/// {@template checks_update_request_any_of_1_output}
/// Check runs can accept a variety of data in the `output` object, including a
/// `title` and `summary` and can optionally provide descriptive details about
/// the run.
/// {@endtemplate}
@immutable
class ChecksUpdateRequestAnyOf1Output {
  /// {@macro checks_update_request_any_of_1_output}
  ChecksUpdateRequestAnyOf1Output({
    required this.summary,
    this.title,
    this.text,
    this.annotations,
    this.images,
  }) {
    summary.validate(maxLength: 65535);
    text?.validate(maxLength: 65535);
    annotations?.validate(maxItems: 50);
  }

  /// Converts a `Map<String, dynamic>` to a [ChecksUpdateRequestAnyOf1Output].
  factory ChecksUpdateRequestAnyOf1Output.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChecksUpdateRequestAnyOf1Output',
      json,
      () => ChecksUpdateRequestAnyOf1Output(
        title: json['title'] as String?,
        summary: json['summary'] as String,
        text: json['text'] as String?,
        annotations: (json['annotations'] as List?)
            ?.map<ChecksUpdateRequestAnyOf1OutputAnnotationsInner>(
              (e) => ChecksUpdateRequestAnyOf1OutputAnnotationsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        images: (json['images'] as List?)
            ?.map<ChecksUpdateRequestAnyOf1OutputImagesInner>(
              (e) => ChecksUpdateRequestAnyOf1OutputImagesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksUpdateRequestAnyOf1Output? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChecksUpdateRequestAnyOf1Output.fromJson(json);
  }

  /// **Required**.
  final String? title;

  /// Can contain Markdown.
  final String summary;

  /// Can contain Markdown.
  final String? text;

  /// Adds information from your analysis to specific lines of code.
  /// Annotations are visible in GitHub's pull request UI. Annotations are
  /// visible in GitHub's pull request UI. The Checks API limits the number of
  /// annotations to a maximum of 50 per API request. To create more than 50
  /// annotations, you have to make multiple requests to the [Update a check
  /// run](https://docs.github.com/rest/checks/runs#update-a-check-run)
  /// endpoint. Each time you update the check run, annotations are appended
  /// to the list of annotations that already exist for the check run. GitHub
  /// Actions are limited to 10 warning annotations and 10 error annotations
  /// per step. For details about annotations in the UI, see "[About status
  /// checks](https://docs.github.com/articles/about-status-checks#checks)".
  final List<ChecksUpdateRequestAnyOf1OutputAnnotationsInner>? annotations;

  /// Adds images to the output displayed in the GitHub pull request UI.
  final List<ChecksUpdateRequestAnyOf1OutputImagesInner>? images;

  /// Converts a [ChecksUpdateRequestAnyOf1Output] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'title': ?title,
      'summary': summary,
      'text': ?text,
      'annotations': ?annotations?.map((e) => e.toJson()).toList(),
      'images': ?images?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    title,
    summary,
    text,
    listHash(annotations),
    listHash(images),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksUpdateRequestAnyOf1Output &&
        title == other.title &&
        summary == other.summary &&
        text == other.text &&
        listsEqual(annotations, other.annotations) &&
        listsEqual(images, other.images);
  }
}
