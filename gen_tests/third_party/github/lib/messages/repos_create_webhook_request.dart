import 'package:github/model_helpers.dart';
import 'package:github/models/repos_create_webhook_request_config.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateWebhookRequest {
  const ReposCreateWebhookRequest({
    this.name,
    this.config,
    this.events = const <String>['push'],
    this.active = true,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposCreateWebhookRequest].
  factory ReposCreateWebhookRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreateWebhookRequest',
      json,
      () => ReposCreateWebhookRequest(
        name: json['name'] as String?,
        config: ReposCreateWebhookRequestConfig.maybeFromJson(
          json['config'] as Map<String, dynamic>?,
        ),
        events:
            (json['events'] as List?)?.cast<String>() ?? const <String>['push'],
        active: (json['active'] as bool?) ?? true,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateWebhookRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateWebhookRequest.fromJson(json);
  }

  /// Use `web` to create a webhook. Default: `web`. This parameter only
  /// accepts the value `web`.
  final String? name;

  /// Key/value pairs to provide settings for this webhook.
  final ReposCreateWebhookRequestConfig? config;

  /// Determines what
  /// [events](https://docs.github.com/webhooks/event-payloads) the hook is
  /// triggered for.
  final List<String> events;

  /// Determines if notifications are sent when the webhook is triggered. Set
  /// to `true` to send notifications.
  final bool active;

  /// Converts a [ReposCreateWebhookRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (config != null) 'config': config?.toJson(),
      'events': events,
      'active': active,
    };
  }

  @override
  int get hashCode => Object.hashAll([name, config, listHash(events), active]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateWebhookRequest &&
        name == other.name &&
        config == other.config &&
        listsEqual(events, other.events) &&
        active == other.active;
  }
}
