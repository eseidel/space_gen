// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repos_update_release_request_make_latest.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdateReleaseRequest {
  const ReposUpdateReleaseRequest({
    this.tagName,
    this.targetCommitish,
    this.name,
    this.body,
    this.draft,
    this.prerelease,
    this.makeLatest = ReposUpdateReleaseRequestMakeLatest.true_,
    this.discussionCategoryName,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposUpdateReleaseRequest].
  factory ReposUpdateReleaseRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposUpdateReleaseRequest',
      json,
      () => ReposUpdateReleaseRequest(
        tagName: json['tag_name'] as String?,
        targetCommitish: json['target_commitish'] as String?,
        name: json['name'] as String?,
        body: json['body'] as String?,
        draft: json['draft'] as bool?,
        prerelease: json['prerelease'] as bool?,
        makeLatest:
            ReposUpdateReleaseRequestMakeLatest.maybeFromJson(
              json['make_latest'] as String?,
            ) ??
            ReposUpdateReleaseRequestMakeLatest.true_,
        discussionCategoryName: json['discussion_category_name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateReleaseRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposUpdateReleaseRequest.fromJson(json);
  }

  /// The name of the tag.
  final String? tagName;

  /// Specifies the commitish value that determines where the Git tag is
  /// created from. Can be any branch or commit SHA. Unused if the Git tag
  /// already exists. Default: the repository's default branch.
  final String? targetCommitish;

  /// The name of the release.
  final String? name;

  /// Text describing the contents of the tag.
  final String? body;

  /// `true` makes the release a draft, and `false` publishes the release.
  final bool? draft;

  /// `true` to identify the release as a prerelease, `false` to identify the
  /// release as a full release.
  final bool? prerelease;

  /// Specifies whether this release should be set as the latest release for
  /// the repository. Drafts and prereleases cannot be set as latest. Defaults
  /// to `true` for newly published releases. `legacy` specifies that the
  /// latest release should be determined based on the release creation date
  /// and higher semantic version.
  final ReposUpdateReleaseRequestMakeLatest makeLatest;

  /// If specified, a discussion of the specified category is created and
  /// linked to the release. The value must be a category that already exists
  /// in the repository. If there is already a discussion linked to the
  /// release, this parameter is ignored. For more information, see "[Managing
  /// categories for discussions in your
  /// repository](https://docs.github.com/discussions/managing-discussions-for-your-community/managing-categories-for-discussions-in-your-repository)."
  final String? discussionCategoryName;

  /// Converts a [ReposUpdateReleaseRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (tagName != null) 'tag_name': tagName,
      if (targetCommitish != null) 'target_commitish': targetCommitish,
      if (name != null) 'name': name,
      if (body != null) 'body': body,
      if (draft != null) 'draft': draft,
      if (prerelease != null) 'prerelease': prerelease,
      'make_latest': makeLatest.toJson(),
      if (discussionCategoryName != null)
        'discussion_category_name': discussionCategoryName,
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
    makeLatest,
    discussionCategoryName,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateReleaseRequest &&
        tagName == other.tagName &&
        targetCommitish == other.targetCommitish &&
        name == other.name &&
        body == other.body &&
        draft == other.draft &&
        prerelease == other.prerelease &&
        makeLatest == other.makeLatest &&
        discussionCategoryName == other.discussionCategoryName;
  }
}
