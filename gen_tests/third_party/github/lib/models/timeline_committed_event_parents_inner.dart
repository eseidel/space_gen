import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TimelineCommittedEventParentsInner {
  const TimelineCommittedEventParentsInner({
    required this.sha,
    required this.url,
    required this.htmlUrl,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [TimelineCommittedEventParentsInner].
  factory TimelineCommittedEventParentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TimelineCommittedEventParentsInner',
      json,
      () => TimelineCommittedEventParentsInner(
        sha: json['sha'] as String,
        url: Uri.parse(json['url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TimelineCommittedEventParentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TimelineCommittedEventParentsInner.fromJson(json);
  }

  /// SHA for the commit
  /// Example: `'7638417db6d59f3c431d3e1f261cc637155684cd'`
  final String sha;
  final Uri url;
  final Uri htmlUrl;

  /// Converts a [TimelineCommittedEventParentsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sha': sha, 'url': url.toString(), 'html_url': htmlUrl.toString()};
  }

  @override
  int get hashCode => Object.hashAll([sha, url, htmlUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimelineCommittedEventParentsInner &&
        sha == other.sha &&
        url == other.url &&
        htmlUrl == other.htmlUrl;
  }
}
