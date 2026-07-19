// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repos_create_release_request_make_latest.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateReleaseRequest {
  const ReposCreateReleaseRequest({
    required this.tagName,
    this.targetCommitish,
    this.name,
    this.body,
    this.draft = false,
    this.prerelease = false,
    this.discussionCategoryName,
    this.generateReleaseNotes = false,
    this.makeLatest = .true_,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposCreateReleaseRequest].
  factory ReposCreateReleaseRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreateReleaseRequest',
      json,
      () => ReposCreateReleaseRequest(
        tagName: json['tag_name'] as String,
        targetCommitish: json['target_commitish'] as String?,
        name: json['name'] as String?,
        body: json['body'] as String?,
        draft: (json['draft'] as bool?) ?? false,
        prerelease: (json['prerelease'] as bool?) ?? false,
        discussionCategoryName: json['discussion_category_name'] as String?,
        generateReleaseNotes:
            (json['generate_release_notes'] as bool?) ?? false,
        makeLatest:
            ReposCreateReleaseRequestMakeLatest.maybeFromJson(
              json['make_latest'] as String?,
            ) ??
            .true_,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateReleaseRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateReleaseRequest.fromJson(json);
  }

  /// The name of the tag.
  final String tagName;

  /// Specifies the commitish value that determines where the Git tag is
  /// created from. Can be any branch or commit SHA. Unused if the Git tag
  /// already exists. Default: the repository's default branch.
  final String? targetCommitish;

  /// The name of the release.
  final String? name;

  /// Text describing the contents of the tag.
  final String? body;

  /// `true` to create a draft (unpublished) release, `false` to create a
  /// published one.
  final bool draft;

  /// `true` to identify the release as a prerelease. `false` to identify the
  /// release as a full release.
  final bool prerelease;

  /// If specified, a discussion of the specified category is created and
  /// linked to the release. The value must be a category that already exists
  /// in the repository. For more information, see "[Managing categories for
  /// discussions in your
  /// repository](https://docs.github.com/discussions/managing-discussions-for-your-community/managing-categories-for-discussions-in-your-repository)."
  final String? discussionCategoryName;

  /// Whether to automatically generate the name and body for this release. If
  /// `name` is specified, the specified name will be used; otherwise, a name
  /// will be automatically generated. If `body` is specified, the body will
  /// be pre-pended to the automatically generated notes.
  final bool generateReleaseNotes;

  /// Specifies whether this release should be set as the latest release for
  /// the repository. Drafts and prereleases cannot be set as latest. Defaults
  /// to `true` for newly published releases. `legacy` specifies that the
  /// latest release should be determined based on the release creation date
  /// and higher semantic version.
  final ReposCreateReleaseRequestMakeLatest makeLatest;

  /// Converts a [ReposCreateReleaseRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'tag_name': tagName,
      'target_commitish': ?targetCommitish,
      'name': ?name,
      'body': ?body,
      'draft': draft,
      'prerelease': prerelease,
      'discussion_category_name': ?discussionCategoryName,
      'generate_release_notes': generateReleaseNotes,
      'make_latest': makeLatest.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    tagName,
    targetCommitish,
    name,
    body,
    draft,
    prerelease,
    discussionCategoryName,
    generateReleaseNotes,
    makeLatest,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateReleaseRequest &&
        tagName == other.tagName &&
        targetCommitish == other.targetCommitish &&
        name == other.name &&
        body == other.body &&
        draft == other.draft &&
        prerelease == other.prerelease &&
        discussionCategoryName == other.discussionCategoryName &&
        generateReleaseNotes == other.generateReleaseNotes &&
        makeLatest == other.makeLatest;
  }
}
