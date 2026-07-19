// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/actions_create_hosted_runner_for_org_request_image_source.dart';
import 'package:meta/meta.dart';

/// {@template actions_create_hosted_runner_for_org_request_image}
/// The image of runner. To list all available images, use `GET /actions/hosted-runners/images/github-owned`
/// or `GET /actions/hosted-runners/images/partner`.
/// {@endtemplate}
@immutable
class ActionsCreateHostedRunnerForOrgRequestImage {
  /// {@macro actions_create_hosted_runner_for_org_request_image}
  const ActionsCreateHostedRunnerForOrgRequestImage({this.id, this.source});

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsCreateHostedRunnerForOrgRequestImage].
  factory ActionsCreateHostedRunnerForOrgRequestImage.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsCreateHostedRunnerForOrgRequestImage',
      json,
      () => ActionsCreateHostedRunnerForOrgRequestImage(
        id: json['id'] as String?,
        source: ActionsCreateHostedRunnerForOrgRequestImageSource.maybeFromJson(
          json['source'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCreateHostedRunnerForOrgRequestImage? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCreateHostedRunnerForOrgRequestImage.fromJson(json);
  }

  /// The unique identifier of the runner image.
  final String? id;

  /// The source of the runner image.
  final ActionsCreateHostedRunnerForOrgRequestImageSource? source;

  /// Converts an [ActionsCreateHostedRunnerForOrgRequestImage]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id, 'source': source?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([id, source]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCreateHostedRunnerForOrgRequestImage &&
        id == other.id &&
        source == other.source;
  }
}
