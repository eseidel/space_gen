import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ThreadSubject {
  const ThreadSubject({
    required this.title,
    required this.url,
    required this.latestCommentUrl,
    required this.type,
  });

  /// Converts a `Map<String, dynamic>` to a [ThreadSubject].
  factory ThreadSubject.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ThreadSubject',
      json,
      () => ThreadSubject(
        title: json['title'] as String,
        url: json['url'] as String,
        latestCommentUrl: json['latest_comment_url'] as String,
        type: json['type'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ThreadSubject? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ThreadSubject.fromJson(json);
  }

  final String title;
  final String url;
  final String latestCommentUrl;
  final String type;

  /// Converts a [ThreadSubject] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'latest_comment_url': latestCommentUrl,
      'type': type,
    };
  }

  @override
  int get hashCode => Object.hashAll([title, url, latestCommentUrl, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThreadSubject &&
        title == other.title &&
        url == other.url &&
        latestCommentUrl == other.latestCommentUrl &&
        type == other.type;
  }
}
