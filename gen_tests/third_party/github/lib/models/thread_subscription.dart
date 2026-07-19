import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template thread_subscription}
/// Thread Subscription
/// Thread Subscription
/// {@endtemplate}
@immutable
class ThreadSubscription {
  /// {@macro thread_subscription}
  const ThreadSubscription({
    required this.subscribed,
    required this.ignored,
    required this.reason,
    required this.createdAt,
    required this.url,
    this.threadUrl,
    this.repositoryUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [ThreadSubscription].
  factory ThreadSubscription.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ThreadSubscription',
      json,
      () => ThreadSubscription(
        subscribed: json['subscribed'] as bool,
        ignored: json['ignored'] as bool,
        reason: checkedKey(json, 'reason') as String?,
        createdAt: maybeParseDateTime(
          checkedKey(json, 'created_at') as String?,
        ),
        url: Uri.parse(json['url'] as String),
        threadUrl: maybeParseUri(json['thread_url'] as String?),
        repositoryUrl: maybeParseUri(json['repository_url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ThreadSubscription? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ThreadSubscription.fromJson(json);
  }

  /// Example: `true`
  final bool subscribed;
  final bool ignored;
  final String? reason;

  /// Example: `'2012-10-06T21:34:12Z'`
  final DateTime? createdAt;

  /// Example: `'https://api.github.com/notifications/threads/1/subscription'`
  final Uri url;

  /// Example: `'https://api.github.com/notifications/threads/1'`
  final Uri? threadUrl;

  /// Example: `'https://api.github.com/repos/1'`
  final Uri? repositoryUrl;

  /// Converts a [ThreadSubscription] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'subscribed': subscribed,
      'ignored': ignored,
      'reason': reason,
      'created_at': createdAt?.toIso8601String(),
      'url': url.toString(),
      'thread_url': ?threadUrl?.toString(),
      'repository_url': ?repositoryUrl?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    subscribed,
    ignored,
    reason,
    createdAt,
    url,
    threadUrl,
    repositoryUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThreadSubscription &&
        subscribed == other.subscribed &&
        ignored == other.ignored &&
        reason == other.reason &&
        createdAt == other.createdAt &&
        url == other.url &&
        threadUrl == other.threadUrl &&
        repositoryUrl == other.repositoryUrl;
  }
}
