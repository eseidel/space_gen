import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template hook_delivery_item}
/// Simple webhook delivery
/// Delivery made by a webhook, without request and response information.
/// {@endtemplate}
@immutable
class HookDeliveryItem {
  /// {@macro hook_delivery_item}
  const HookDeliveryItem({
    required this.id,
    required this.guid,
    required this.deliveredAt,
    required this.redelivery,
    required this.duration,
    required this.status,
    required this.statusCode,
    required this.event,
    required this.action,
    required this.installationId,
    required this.repositoryId,
    this.throttledAt,
  });

  /// Converts a `Map<String, dynamic>` to a [HookDeliveryItem].
  factory HookDeliveryItem.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'HookDeliveryItem',
      json,
      () => HookDeliveryItem(
        id: json['id'] as int,
        guid: json['guid'] as String,
        deliveredAt: DateTime.parse(json['delivered_at'] as String),
        redelivery: json['redelivery'] as bool,
        duration: (json['duration'] as num).toDouble(),
        status: json['status'] as String,
        statusCode: json['status_code'] as int,
        event: json['event'] as String,
        action: checkedKey(json, 'action') as String?,
        installationId: checkedKey(json, 'installation_id') as int?,
        repositoryId: checkedKey(json, 'repository_id') as int?,
        throttledAt: maybeParseDateTime(json['throttled_at'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static HookDeliveryItem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return HookDeliveryItem.fromJson(json);
  }

  /// Unique identifier of the webhook delivery.
  /// Example: `42`
  final int id;

  /// Unique identifier for the event (shared with all deliveries for all
  /// webhooks that subscribe to this event).
  /// Example: `'58474f00-b361-11eb-836d-0e4f3503ccbe'`
  final String guid;

  /// Time when the webhook delivery occurred.
  /// Example: `'2021-05-12T20:33:44Z'`
  final DateTime deliveredAt;

  /// Whether the webhook delivery is a redelivery.
  /// Example: `false`
  final bool redelivery;

  /// Time spent delivering.
  /// Example: `0.03`
  final double duration;

  /// Describes the response returned after attempting the delivery.
  /// Example: `'failed to connect'`
  final String status;

  /// Status code received when delivery was made.
  /// Example: `502`
  final int statusCode;

  /// The event that triggered the delivery.
  /// Example: `'issues'`
  final String event;

  /// The type of activity for the event that triggered the delivery.
  /// Example: `'opened'`
  final String? action;

  /// The id of the GitHub App installation associated with this event.
  /// Example: `123`
  final int? installationId;

  /// The id of the repository associated with this event.
  /// Example: `123`
  final int? repositoryId;

  /// Time when the webhook delivery was throttled.
  /// Example: `'2021-05-12T20:33:44Z'`
  final DateTime? throttledAt;

  /// Converts a [HookDeliveryItem] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'guid': guid,
      'delivered_at': deliveredAt.toIso8601String(),
      'redelivery': redelivery,
      'duration': duration,
      'status': status,
      'status_code': statusCode,
      'event': event,
      'action': action,
      'installation_id': installationId,
      'repository_id': repositoryId,
      'throttled_at': throttledAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    guid,
    deliveredAt,
    redelivery,
    duration,
    status,
    statusCode,
    event,
    action,
    installationId,
    repositoryId,
    throttledAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HookDeliveryItem &&
        id == other.id &&
        guid == other.guid &&
        deliveredAt == other.deliveredAt &&
        redelivery == other.redelivery &&
        duration == other.duration &&
        status == other.status &&
        statusCode == other.statusCode &&
        event == other.event &&
        action == other.action &&
        installationId == other.installationId &&
        repositoryId == other.repositoryId &&
        throttledAt == other.throttledAt;
  }
}
