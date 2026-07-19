// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_location_discussion_body}
/// Represents a 'discussion_body' secret scanning location type. This location
/// type shows that a secret was detected in the body of a discussion.
/// {@endtemplate}
@immutable
class SecretScanningLocationDiscussionBody {
  /// {@macro secret_scanning_location_discussion_body}
  const SecretScanningLocationDiscussionBody({required this.discussionBodyUrl});

  /// Converts a `Map<String, dynamic>` to a
  /// [SecretScanningLocationDiscussionBody].
  factory SecretScanningLocationDiscussionBody.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecretScanningLocationDiscussionBody',
      json,
      () => SecretScanningLocationDiscussionBody(
        discussionBodyUrl: Uri.parse(json['discussion_body_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationDiscussionBody? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationDiscussionBody.fromJson(json);
  }

  /// The URL to the discussion where the secret was detected.
  /// Example:
  /// `'https://github.com/community/community/discussions/39082#discussion-4566270'`
  final Uri discussionBodyUrl;

  /// Converts a [SecretScanningLocationDiscussionBody]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'discussion_body_url': discussionBodyUrl.toString()};
  }

  @override
  int get hashCode => discussionBodyUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationDiscussionBody &&
        discussionBodyUrl == other.discussionBodyUrl;
  }
}
