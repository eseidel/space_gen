import 'package:github/messages/hook_response.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/webhook_config.dart';
import 'package:meta/meta.dart';

/// {@template hook}
/// Webhook
/// Webhooks for repositories.
/// {@endtemplate}
@immutable
class Hook {
  /// {@macro hook}
  const Hook({
    required this.type,
    required this.id,
    required this.name,
    required this.active,
    required this.events,
    required this.config,
    required this.updatedAt,
    required this.createdAt,
    required this.url,
    required this.testUrl,
    required this.pingUrl,
    required this.lastResponse,
    this.deliveriesUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [Hook].
  factory Hook.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Hook',
      json,
      () => Hook(
        type: json['type'] as String,
        id: json['id'] as int,
        name: json['name'] as String,
        active: json['active'] as bool,
        events: (json['events'] as List).cast<String>(),
        config: WebhookConfig.fromJson(json['config'] as Map<String, dynamic>),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        url: Uri.parse(json['url'] as String),
        testUrl: Uri.parse(json['test_url'] as String),
        pingUrl: Uri.parse(json['ping_url'] as String),
        deliveriesUrl: maybeParseUri(json['deliveries_url'] as String?),
        lastResponse: HookResponse.fromJson(
          json['last_response'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Hook? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Hook.fromJson(json);
  }

  final String type;

  /// Unique identifier of the webhook.
  /// Example: `42`
  final int id;

  /// The name of a valid service, use 'web' for a webhook.
  /// Example: `'web'`
  final String name;

  /// Determines whether the hook is actually triggered on pushes.
  /// Example: `true`
  final bool active;

  /// Determines what events the hook is triggered for. Default: ['push'].
  /// Example: `'push'`
  /// Example: `'pull_request'`
  final List<String> events;

  /// Webhook Configuration
  /// Configuration object of the webhook
  final WebhookConfig config;

  /// Example: `'2011-09-06T20:39:23Z'`
  final DateTime updatedAt;

  /// Example: `'2011-09-06T17:26:27Z'`
  final DateTime createdAt;

  /// Example: `'https://api.github.com/repos/octocat/Hello-World/hooks/1'`
  final Uri url;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/hooks/1/test'`
  final Uri testUrl;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/hooks/1/pings'`
  final Uri pingUrl;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/hooks/1/deliveries'`
  final Uri? deliveriesUrl;

  /// Hook Response
  final HookResponse lastResponse;

  /// Converts a [Hook] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'name': name,
      'active': active,
      'events': events,
      'config': config.toJson(),
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'url': url.toString(),
      'test_url': testUrl.toString(),
      'ping_url': pingUrl.toString(),
      'deliveries_url': ?deliveriesUrl?.toString(),
      'last_response': lastResponse.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    id,
    name,
    active,
    listHash(events),
    config,
    updatedAt,
    createdAt,
    url,
    testUrl,
    pingUrl,
    deliveriesUrl,
    lastResponse,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Hook &&
        type == other.type &&
        id == other.id &&
        name == other.name &&
        active == other.active &&
        listsEqual(events, other.events) &&
        config == other.config &&
        updatedAt == other.updatedAt &&
        createdAt == other.createdAt &&
        url == other.url &&
        testUrl == other.testUrl &&
        pingUrl == other.pingUrl &&
        deliveriesUrl == other.deliveriesUrl &&
        lastResponse == other.lastResponse;
  }
}
