// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template codespaces_create_for_authenticated_user_request_one_of_1_pull_request}
/// Pull request number for this codespace
/// {@endtemplate}
@immutable
class CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest {
  /// {@macro codespaces_create_for_authenticated_user_request_one_of_1_pull_request}
  const CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest({
    required this.pullRequestNumber,
    required this.repositoryId,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest].
  factory CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest',
      json,
      () => CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest(
        pullRequestNumber: json['pull_request_number'] as int,
        repositoryId: json['repository_id'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest.fromJson(
      json,
    );
  }

  /// Pull request number
  final int pullRequestNumber;

  /// Repository id for this codespace
  final int repositoryId;

  /// Converts a [CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'pull_request_number': pullRequestNumber,
      'repository_id': repositoryId,
    };
  }

  @override
  int get hashCode => Object.hashAll([pullRequestNumber, repositoryId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest &&
        pullRequestNumber == other.pullRequestNumber &&
        repositoryId == other.repositoryId;
  }
}
