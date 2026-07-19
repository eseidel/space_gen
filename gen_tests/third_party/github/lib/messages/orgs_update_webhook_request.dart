import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_update_webhook_request_config.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsUpdateWebhookRequest {
  const OrgsUpdateWebhookRequest({
    this.config,
    this.events = const <String>['push'],
    this.active = true,
    this.name,
  });

  /// Converts a `Map<String, dynamic>` to an [OrgsUpdateWebhookRequest].
  factory OrgsUpdateWebhookRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsUpdateWebhookRequest',
      json,
      () => OrgsUpdateWebhookRequest(
        config: OrgsUpdateWebhookRequestConfig.maybeFromJson(
          json['config'] as Map<String, dynamic>?,
        ),
        events:
            (json['events'] as List?)?.cast<String>() ?? const <String>['push'],
        active: (json['active'] as bool?) ?? true,
        name: json['name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsUpdateWebhookRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrgsUpdateWebhookRequest.fromJson(json);
  }

  /// Key/value pairs to provide settings for this webhook.
  final OrgsUpdateWebhookRequestConfig? config;

  /// Determines what
  /// [events](https://docs.github.com/webhooks/event-payloads) the hook is
  /// triggered for.
  final List<String>? events;

  /// Determines if notifications are sent when the webhook is triggered. Set
  /// to `true` to send notifications.
  final bool? active;

  /// Example: `'"web"'`
  final String? name;

  /// Converts an [OrgsUpdateWebhookRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'config': config?.toJson(),
      'events': events,
      'active': active,
      'name': name,
    };
  }

  @override
  int get hashCode => Object.hashAll([config, listHash(events), active, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsUpdateWebhookRequest &&
        config == other.config &&
        listsEqual(events, other.events) &&
        active == other.active &&
        name == other.name;
  }
}
