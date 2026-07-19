// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/models/secret_scanning_location_commit.dart';
import 'package:github/models/secret_scanning_location_discussion_body.dart';
import 'package:github/models/secret_scanning_location_discussion_comment.dart';
import 'package:github/models/secret_scanning_location_discussion_title.dart';
import 'package:github/models/secret_scanning_location_issue_body.dart';
import 'package:github/models/secret_scanning_location_issue_comment.dart';
import 'package:github/models/secret_scanning_location_issue_title.dart';
import 'package:github/models/secret_scanning_location_pull_request_body.dart';
import 'package:github/models/secret_scanning_location_pull_request_comment.dart';
import 'package:github/models/secret_scanning_location_pull_request_review.dart';
import 'package:github/models/secret_scanning_location_pull_request_review_comment.dart';
import 'package:github/models/secret_scanning_location_pull_request_title.dart';
import 'package:github/models/secret_scanning_location_wiki_commit.dart';
import 'package:meta/meta.dart';

/// Details on the location where the token was initially detected. This can be
/// a commit, wiki commit, issue, discussion, pull request.
sealed class SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocation();

  factory SecretScanningFirstDetectedLocation.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json.containsKey('blob_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationCommit(
        SecretScanningLocationCommit.fromJson(json),
      );
    }
    if (json.containsKey('page_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationWikiCommit(
        SecretScanningLocationWikiCommit.fromJson(json),
      );
    }
    if (json.containsKey('issue_title_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationIssueTitle(
        SecretScanningLocationIssueTitle.fromJson(json),
      );
    }
    if (json.containsKey('issue_body_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationIssueBody(
        SecretScanningLocationIssueBody.fromJson(json),
      );
    }
    if (json.containsKey('issue_comment_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationIssueComment(
        SecretScanningLocationIssueComment.fromJson(json),
      );
    }
    if (json.containsKey('discussion_title_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationDiscussionTitle(
        SecretScanningLocationDiscussionTitle.fromJson(json),
      );
    }
    if (json.containsKey('discussion_body_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationDiscussionBody(
        SecretScanningLocationDiscussionBody.fromJson(json),
      );
    }
    if (json.containsKey('discussion_comment_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationDiscussionComment(
        SecretScanningLocationDiscussionComment.fromJson(json),
      );
    }
    if (json.containsKey('pull_request_title_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestTitle(
        SecretScanningLocationPullRequestTitle.fromJson(json),
      );
    }
    if (json.containsKey('pull_request_body_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestBody(
        SecretScanningLocationPullRequestBody.fromJson(json),
      );
    }
    if (json.containsKey('pull_request_comment_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestComment(
        SecretScanningLocationPullRequestComment.fromJson(json),
      );
    }
    if (json.containsKey('pull_request_review_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestReview(
        SecretScanningLocationPullRequestReview.fromJson(json),
      );
    }
    if (json.containsKey('pull_request_review_comment_url')) {
      return SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestReviewComment(
        SecretScanningLocationPullRequestReviewComment.fromJson(json),
      );
    }
    throw FormatException(
      'No variant of SecretScanningFirstDetectedLocation matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningFirstDetectedLocation? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningFirstDetectedLocation.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationCommit
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationCommit(
    this.value,
  );

  final SecretScanningLocationCommit value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationCommit &&
        value == other.value;
  }
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationWikiCommit
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationWikiCommit(
    this.value,
  );

  final SecretScanningLocationWikiCommit value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationWikiCommit &&
        value == other.value;
  }
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationIssueTitle
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationIssueTitle(
    this.value,
  );

  final SecretScanningLocationIssueTitle value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationIssueTitle &&
        value == other.value;
  }
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationIssueBody
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationIssueBody(
    this.value,
  );

  final SecretScanningLocationIssueBody value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationIssueBody &&
        value == other.value;
  }
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationIssueComment
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationIssueComment(
    this.value,
  );

  final SecretScanningLocationIssueComment value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationIssueComment &&
        value == other.value;
  }
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationDiscussionTitle
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationDiscussionTitle(
    this.value,
  );

  final SecretScanningLocationDiscussionTitle value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationDiscussionTitle &&
        value == other.value;
  }
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationDiscussionBody
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationDiscussionBody(
    this.value,
  );

  final SecretScanningLocationDiscussionBody value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationDiscussionBody &&
        value == other.value;
  }
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationDiscussionComment
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationDiscussionComment(
    this.value,
  );

  final SecretScanningLocationDiscussionComment value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationDiscussionComment &&
        value == other.value;
  }
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestTitle
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestTitle(
    this.value,
  );

  final SecretScanningLocationPullRequestTitle value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestTitle &&
        value == other.value;
  }
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestBody
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestBody(
    this.value,
  );

  final SecretScanningLocationPullRequestBody value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestBody &&
        value == other.value;
  }
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestComment
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestComment(
    this.value,
  );

  final SecretScanningLocationPullRequestComment value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestComment &&
        value == other.value;
  }
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestReview
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestReview(
    this.value,
  );

  final SecretScanningLocationPullRequestReview value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestReview &&
        value == other.value;
  }
}

@immutable
final class SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestReviewComment
    extends SecretScanningFirstDetectedLocation {
  const SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestReviewComment(
    this.value,
  );

  final SecretScanningLocationPullRequestReviewComment value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SecretScanningFirstDetectedLocationSecretScanningLocationPullRequestReviewComment &&
        value == other.value;
  }
}
