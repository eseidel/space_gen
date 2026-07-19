import 'package:github/model_helpers.dart';
import 'package:github/models/checks_create_request_one_of_0_output_annotations_inner.dart';
import 'package:github/models/checks_create_request_one_of_0_output_images_inner.dart';
import 'package:meta/meta.dart';

/// {@template checks_create_request_one_of_0_output}
/// Check runs can accept a variety of data in the `output` object, including a
/// `title` and `summary` and can optionally provide descriptive details about
/// the run.
/// {@endtemplate}
@immutable
class ChecksCreateRequestOneOf0Output {
  /// {@macro checks_create_request_one_of_0_output}
  const ChecksCreateRequestOneOf0Output({
    required this.title,
    required this.summary,
    this.text,
    this.annotations,
    this.images,
  });

  /// Converts a `Map<String, dynamic>` to a [ChecksCreateRequestOneOf0Output].
  factory ChecksCreateRequestOneOf0Output.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChecksCreateRequestOneOf0Output',
      json,
      () => ChecksCreateRequestOneOf0Output(
        title: json['title'] as String,
        summary: json['summary'] as String,
        text: json['text'] as String?,
        annotations: (json['annotations'] as List?)
            ?.map<ChecksCreateRequestOneOf0OutputAnnotationsInner>(
              (e) => ChecksCreateRequestOneOf0OutputAnnotationsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        images: (json['images'] as List?)
            ?.map<ChecksCreateRequestOneOf0OutputImagesInner>(
              (e) => ChecksCreateRequestOneOf0OutputImagesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksCreateRequestOneOf0Output? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChecksCreateRequestOneOf0Output.fromJson(json);
  }

  /// The title of the check run.
  final String title;

  /// The summary of the check run. This parameter supports Markdown.
  /// **Maximum length**: 65535 characters.
  final String summary;

  /// The details of the check run. This parameter supports Markdown.
  /// **Maximum length**: 65535 characters.
  final String? text;

  /// Adds information from your analysis to specific lines of code.
  /// Annotations are visible on GitHub in the **Checks** and **Files
  /// changed** tab of the pull request. The Checks API limits the number of
  /// annotations to a maximum of 50 per API request. To create more than 50
  /// annotations, you have to make multiple requests to the [Update a check
  /// run](https://docs.github.com/rest/checks/runs#update-a-check-run)
  /// endpoint. Each time you update the check run, annotations are appended
  /// to the list of annotations that already exist for the check run. GitHub
  /// Actions are limited to 10 warning annotations and 10 error annotations
  /// per step. For details about how you can view annotations on GitHub, see
  /// "[About status
  /// checks](https://docs.github.com/articles/about-status-checks#checks)".
  final List<ChecksCreateRequestOneOf0OutputAnnotationsInner>? annotations;

  /// Adds images to the output displayed in the GitHub pull request UI.
  final List<ChecksCreateRequestOneOf0OutputImagesInner>? images;

  /// Converts a [ChecksCreateRequestOneOf0Output] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
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
    return other is ChecksCreateRequestOneOf0Output &&
        title == other.title &&
        summary == other.summary &&
        text == other.text &&
        listsEqual(annotations, other.annotations) &&
        listsEqual(images, other.images);
  }
}
