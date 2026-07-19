import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class EventPayloadPagesInner {
  const EventPayloadPagesInner({
    this.pageName,
    this.title,
    this.summary,
    this.action,
    this.sha,
    this.htmlUrl,
  });

  /// Converts a `Map<String, dynamic>` to an [EventPayloadPagesInner].
  factory EventPayloadPagesInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EventPayloadPagesInner',
      json,
      () => EventPayloadPagesInner(
        pageName: json['page_name'] as String?,
        title: json['title'] as String?,
        summary: json['summary'] as String?,
        action: json['action'] as String?,
        sha: json['sha'] as String?,
        htmlUrl: json['html_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EventPayloadPagesInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EventPayloadPagesInner.fromJson(json);
  }

  final String? pageName;
  final String? title;
  final String? summary;
  final String? action;
  final String? sha;
  final String? htmlUrl;

  /// Converts an [EventPayloadPagesInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'page_name': pageName,
      'title': title,
      'summary': summary,
      'action': action,
      'sha': sha,
      'html_url': htmlUrl,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([pageName, title, summary, action, sha, htmlUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EventPayloadPagesInner &&
        pageName == other.pageName &&
        title == other.title &&
        summary == other.summary &&
        action == other.action &&
        sha == other.sha &&
        htmlUrl == other.htmlUrl;
  }
}
