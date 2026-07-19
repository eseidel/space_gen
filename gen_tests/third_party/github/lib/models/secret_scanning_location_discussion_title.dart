import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_location_discussion_title}
/// Represents a 'discussion_title' secret scanning location type. This location
/// type shows that a secret was detected in the title of a discussion.
/// {@endtemplate}
@immutable
class SecretScanningLocationDiscussionTitle {
  /// {@macro secret_scanning_location_discussion_title}
  const SecretScanningLocationDiscussionTitle({
    required this.discussionTitleUrl,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SecretScanningLocationDiscussionTitle].
  factory SecretScanningLocationDiscussionTitle.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecretScanningLocationDiscussionTitle',
      json,
      () => SecretScanningLocationDiscussionTitle(
        discussionTitleUrl: Uri.parse(json['discussion_title_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationDiscussionTitle? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationDiscussionTitle.fromJson(json);
  }

  /// The URL to the discussion where the secret was detected.
  /// Example: `'https://github.com/community/community/discussions/39082'`
  final Uri discussionTitleUrl;

  /// Converts a [SecretScanningLocationDiscussionTitle]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'discussion_title_url': discussionTitleUrl.toString()};
  }

  @override
  int get hashCode => discussionTitleUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationDiscussionTitle &&
        discussionTitleUrl == other.discussionTitleUrl;
  }
}
