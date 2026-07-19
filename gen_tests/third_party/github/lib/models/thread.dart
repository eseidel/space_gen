import 'package:github/model_helpers.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:github/models/thread_subject.dart';
import 'package:meta/meta.dart';

/// {@template thread}
/// Thread
/// Thread
/// {@endtemplate}
@immutable
class Thread {
  /// {@macro thread}
  const Thread({
    required this.id,
    required this.repository,
    required this.subject,
    required this.reason,
    required this.unread,
    required this.updatedAt,
    required this.lastReadAt,
    required this.url,
    required this.subscriptionUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [Thread].
  factory Thread.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Thread',
      json,
      () => Thread(
        id: json['id'] as String,
        repository: MinimalRepository.fromJson(
          json['repository'] as Map<String, dynamic>,
        ),
        subject: ThreadSubject.fromJson(
          json['subject'] as Map<String, dynamic>,
        ),
        reason: json['reason'] as String,
        unread: json['unread'] as bool,
        updatedAt: json['updated_at'] as String,
        lastReadAt: checkedKey(json, 'last_read_at') as String?,
        url: json['url'] as String,
        subscriptionUrl: json['subscription_url'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Thread? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Thread.fromJson(json);
  }

  final String id;

  /// Minimal Repository
  /// Minimal Repository
  final MinimalRepository repository;
  final ThreadSubject subject;
  final String reason;
  final bool unread;
  final String updatedAt;
  final String? lastReadAt;
  final String url;

  /// Example: `'https://api.github.com/notifications/threads/2/subscription'`
  final String subscriptionUrl;

  /// Converts a [Thread] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'repository': repository.toJson(),
      'subject': subject.toJson(),
      'reason': reason,
      'unread': unread,
      'updated_at': updatedAt,
      'last_read_at': lastReadAt,
      'url': url,
      'subscription_url': subscriptionUrl,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    repository,
    subject,
    reason,
    unread,
    updatedAt,
    lastReadAt,
    url,
    subscriptionUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Thread &&
        id == other.id &&
        repository == other.repository &&
        subject == other.subject &&
        reason == other.reason &&
        unread == other.unread &&
        updatedAt == other.updatedAt &&
        lastReadAt == other.lastReadAt &&
        url == other.url &&
        subscriptionUrl == other.subscriptionUrl;
  }
}
