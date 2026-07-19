import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposGenerateReleaseNotesRequest {
  const ReposGenerateReleaseNotesRequest({
    required this.tagName,
    this.targetCommitish,
    this.previousTagName,
    this.configurationFilePath,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposGenerateReleaseNotesRequest].
  factory ReposGenerateReleaseNotesRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposGenerateReleaseNotesRequest',
      json,
      () => ReposGenerateReleaseNotesRequest(
        tagName: json['tag_name'] as String,
        targetCommitish: json['target_commitish'] as String?,
        previousTagName: json['previous_tag_name'] as String?,
        configurationFilePath: json['configuration_file_path'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposGenerateReleaseNotesRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposGenerateReleaseNotesRequest.fromJson(json);
  }

  /// The tag name for the release. This can be an existing tag or a new one.
  final String tagName;

  /// Specifies the commitish value that will be the target for the release's
  /// tag. Required if the supplied tag_name does not reference an existing
  /// tag. Ignored if the tag_name already exists.
  final String? targetCommitish;

  /// The name of the previous tag to use as the starting point for the
  /// release notes. Use to manually specify the range for the set of changes
  /// considered as part this release.
  final String? previousTagName;

  /// Specifies a path to a file in the repository containing configuration
  /// settings used for generating the release notes. If unspecified, the
  /// configuration file located in the repository at '.github/release.yml' or
  /// '.github/release.yaml' will be used. If that is not present, the default
  /// configuration will be used.
  final String? configurationFilePath;

  /// Converts a [ReposGenerateReleaseNotesRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'tag_name': tagName,
      'target_commitish': ?targetCommitish,
      'previous_tag_name': ?previousTagName,
      'configuration_file_path': ?configurationFilePath,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    tagName,
    targetCommitish,
    previousTagName,
    configurationFilePath,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGenerateReleaseNotesRequest &&
        tagName == other.tagName &&
        targetCommitish == other.targetCommitish &&
        previousTagName == other.previousTagName &&
        configurationFilePath == other.configurationFilePath;
  }
}
