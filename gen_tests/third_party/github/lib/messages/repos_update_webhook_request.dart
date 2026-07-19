import 'package:github/model_helpers.dart';
import 'package:github/models/webhook_config.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdateWebhookRequest {
  const ReposUpdateWebhookRequest({
    this.config,
    this.events = const <String>['push'],
    this.addEvents,
    this.removeEvents,
    this.active = true,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposUpdateWebhookRequest].
  factory ReposUpdateWebhookRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposUpdateWebhookRequest',
      json,
      () => ReposUpdateWebhookRequest(
        config: WebhookConfig.maybeFromJson(
          json['config'] as Map<String, dynamic>?,
        ),
        events:
            (json['events'] as List?)?.cast<String>() ?? const <String>['push'],
        addEvents: (json['add_events'] as List?)?.cast<String>(),
        removeEvents: (json['remove_events'] as List?)?.cast<String>(),
        active: (json['active'] as bool?) ?? true,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateWebhookRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposUpdateWebhookRequest.fromJson(json);
  }

  /// Webhook Configuration
  /// Configuration object of the webhook
  final WebhookConfig? config;

  /// Determines what
  /// [events](https://docs.github.com/webhooks/event-payloads) the hook is
  /// triggered for. This replaces the entire array of events.
  final List<String> events;

  /// Determines a list of events to be added to the list of events that the
  /// Hook triggers for.
  final List<String>? addEvents;

  /// Determines a list of events to be removed from the list of events that
  /// the Hook triggers for.
  final List<String>? removeEvents;

  /// Determines if notifications are sent when the webhook is triggered. Set
  /// to `true` to send notifications.
  final bool active;

  /// Converts a [ReposUpdateWebhookRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'config': ?config?.toJson(),
      'events': events,
      'add_events': ?addEvents,
      'remove_events': ?removeEvents,
      'active': active,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    config,
    listHash(events),
    listHash(addEvents),
    listHash(removeEvents),
    active,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateWebhookRequest &&
        config == other.config &&
        listsEqual(events, other.events) &&
        listsEqual(addEvents, other.addEvents) &&
        listsEqual(removeEvents, other.removeEvents) &&
        active == other.active;
  }
}
