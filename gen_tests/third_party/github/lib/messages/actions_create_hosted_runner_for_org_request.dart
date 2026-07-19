// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/actions_create_hosted_runner_for_org_request_image.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsCreateHostedRunnerForOrgRequest {
  const ActionsCreateHostedRunnerForOrgRequest({
    required this.name,
    required this.image,
    required this.size,
    required this.runnerGroupId,
    this.maximumRunners,
    this.enableStaticIp,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsCreateHostedRunnerForOrgRequest].
  factory ActionsCreateHostedRunnerForOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsCreateHostedRunnerForOrgRequest',
      json,
      () => ActionsCreateHostedRunnerForOrgRequest(
        name: json['name'] as String,
        image: ActionsCreateHostedRunnerForOrgRequestImage.fromJson(
          json['image'] as Map<String, dynamic>,
        ),
        size: json['size'] as String,
        runnerGroupId: json['runner_group_id'] as int,
        maximumRunners: json['maximum_runners'] as int?,
        enableStaticIp: json['enable_static_ip'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCreateHostedRunnerForOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCreateHostedRunnerForOrgRequest.fromJson(json);
  }

  /// Name of the runner. Must be between 1 and 64 characters and may only
  /// contain upper and lowercase letters a-z, numbers 0-9, '.', '-', and '_'.
  final String name;

  /// The image of runner. To list all available images, use `GET /actions/hosted-runners/images/github-owned`
  /// or `GET /actions/hosted-runners/images/partner`.
  final ActionsCreateHostedRunnerForOrgRequestImage image;

  /// The machine size of the runner. To list available sizes, use `GET actions/hosted-runners/machine-sizes`
  final String size;

  /// The existing runner group to add this runner to.
  final int runnerGroupId;

  /// The maximum amount of runners to scale up to. Runners will not
  /// auto-scale above this number. Use this setting to limit your cost.
  final int? maximumRunners;

  /// Whether this runner should be created with a static public IP. Note
  /// limit on account. To list limits on account, use `GET actions/hosted-runners/limits`
  final bool? enableStaticIp;

  /// Converts an [ActionsCreateHostedRunnerForOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image.toJson(),
      'size': size,
      'runner_group_id': runnerGroupId,
      if (maximumRunners != null) 'maximum_runners': maximumRunners,
      if (enableStaticIp != null) 'enable_static_ip': enableStaticIp,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    image,
    size,
    runnerGroupId,
    maximumRunners,
    enableStaticIp,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCreateHostedRunnerForOrgRequest &&
        name == other.name &&
        image == other.image &&
        size == other.size &&
        runnerGroupId == other.runnerGroupId &&
        maximumRunners == other.maximumRunners &&
        enableStaticIp == other.enableStaticIp;
  }
}
