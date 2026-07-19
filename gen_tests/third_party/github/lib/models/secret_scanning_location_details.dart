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

sealed class SecretScanningLocationDetails {
  const SecretScanningLocationDetails();

  factory SecretScanningLocationDetails.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('blob_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationCommit(
        SecretScanningLocationCommit.fromJson(json),
      );
    }
    if (json.containsKey('page_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationWikiCommit(
        SecretScanningLocationWikiCommit.fromJson(json),
      );
    }
    if (json.containsKey('issue_title_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationIssueTitle(
        SecretScanningLocationIssueTitle.fromJson(json),
      );
    }
    if (json.containsKey('issue_body_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationIssueBody(
        SecretScanningLocationIssueBody.fromJson(json),
      );
    }
    if (json.containsKey('issue_comment_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationIssueComment(
        SecretScanningLocationIssueComment.fromJson(json),
      );
    }
    if (json.containsKey('discussion_title_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationDiscussionTitle(
        SecretScanningLocationDiscussionTitle.fromJson(json),
      );
    }
    if (json.containsKey('discussion_body_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationDiscussionBody(
        SecretScanningLocationDiscussionBody.fromJson(json),
      );
    }
    if (json.containsKey('discussion_comment_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationDiscussionComment(
        SecretScanningLocationDiscussionComment.fromJson(json),
      );
    }
    if (json.containsKey('pull_request_title_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationPullRequestTitle(
        SecretScanningLocationPullRequestTitle.fromJson(json),
      );
    }
    if (json.containsKey('pull_request_body_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationPullRequestBody(
        SecretScanningLocationPullRequestBody.fromJson(json),
      );
    }
    if (json.containsKey('pull_request_comment_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationPullRequestComment(
        SecretScanningLocationPullRequestComment.fromJson(json),
      );
    }
    if (json.containsKey('pull_request_review_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationPullRequestReview(
        SecretScanningLocationPullRequestReview.fromJson(json),
      );
    }
    if (json.containsKey('pull_request_review_comment_url')) {
      return SecretScanningLocationDetailsSecretScanningLocationPullRequestReviewComment(
        SecretScanningLocationPullRequestReviewComment.fromJson(json),
      );
    }
    throw FormatException(
      'No variant of SecretScanningLocationDetails matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationDetails? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationDetails.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationCommit
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationCommit(this.value);

  final SecretScanningLocationCommit value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationDetailsSecretScanningLocationCommit &&
        value == other.value;
  }
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationWikiCommit
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationWikiCommit(
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
            is SecretScanningLocationDetailsSecretScanningLocationWikiCommit &&
        value == other.value;
  }
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationIssueTitle
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationIssueTitle(
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
            is SecretScanningLocationDetailsSecretScanningLocationIssueTitle &&
        value == other.value;
  }
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationIssueBody
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationIssueBody(
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
            is SecretScanningLocationDetailsSecretScanningLocationIssueBody &&
        value == other.value;
  }
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationIssueComment
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationIssueComment(
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
            is SecretScanningLocationDetailsSecretScanningLocationIssueComment &&
        value == other.value;
  }
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationDiscussionTitle
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationDiscussionTitle(
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
            is SecretScanningLocationDetailsSecretScanningLocationDiscussionTitle &&
        value == other.value;
  }
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationDiscussionBody
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationDiscussionBody(
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
            is SecretScanningLocationDetailsSecretScanningLocationDiscussionBody &&
        value == other.value;
  }
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationDiscussionComment
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationDiscussionComment(
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
            is SecretScanningLocationDetailsSecretScanningLocationDiscussionComment &&
        value == other.value;
  }
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationPullRequestTitle
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationPullRequestTitle(
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
            is SecretScanningLocationDetailsSecretScanningLocationPullRequestTitle &&
        value == other.value;
  }
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationPullRequestBody
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationPullRequestBody(
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
            is SecretScanningLocationDetailsSecretScanningLocationPullRequestBody &&
        value == other.value;
  }
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationPullRequestComment
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationPullRequestComment(
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
            is SecretScanningLocationDetailsSecretScanningLocationPullRequestComment &&
        value == other.value;
  }
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationPullRequestReview
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationPullRequestReview(
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
            is SecretScanningLocationDetailsSecretScanningLocationPullRequestReview &&
        value == other.value;
  }
}

@immutable
final class SecretScanningLocationDetailsSecretScanningLocationPullRequestReviewComment
    extends SecretScanningLocationDetails {
  const SecretScanningLocationDetailsSecretScanningLocationPullRequestReviewComment(
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
            is SecretScanningLocationDetailsSecretScanningLocationPullRequestReviewComment &&
        value == other.value;
  }
}
