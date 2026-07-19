import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_create_webhook_request_config.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsCreateWebhookRequest {
  const OrgsCreateWebhookRequest({
    required this.name,
    required this.config,
    this.events = const <String>['push'],
    this.active = true,
  });

  /// Converts a `Map<String, dynamic>` to an [OrgsCreateWebhookRequest].
  factory OrgsCreateWebhookRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsCreateWebhookRequest',
      json,
      () => OrgsCreateWebhookRequest(
        name: json['name'] as String,
        config: OrgsCreateWebhookRequestConfig.fromJson(
          json['config'] as Map<String, dynamic>,
        ),
        events:
            (json['events'] as List?)?.cast<String>() ?? const <String>['push'],
        active: (json['active'] as bool?) ?? true,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsCreateWebhookRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrgsCreateWebhookRequest.fromJson(json);
  }

  /// Must be passed as "web".
  final String name;

  /// Key/value pairs to provide settings for this webhook.
  final OrgsCreateWebhookRequestConfig config;

  /// Determines what
  /// [events](https://docs.github.com/webhooks/event-payloads) the hook is
  /// triggered for. Set to `["*"]` to receive all possible events.
  final List<String>? events;

  /// Determines if notifications are sent when the webhook is triggered. Set
  /// to `true` to send notifications.
  final bool? active;

  /// Converts an [OrgsCreateWebhookRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'config': config.toJson(),
      'events': events,
      'active': active,
    };
  }

  @override
  int get hashCode => Object.hashAll([name, config, listHash(events), active]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsCreateWebhookRequest &&
        name == other.name &&
        config == other.config &&
        listsEqual(events, other.events) &&
        active == other.active;
  }
}
