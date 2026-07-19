import 'package:github/messages/hook_delivery_request.dart';
import 'package:github/messages/hook_delivery_response.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template hook_delivery}
/// Webhook delivery
/// Delivery made by a webhook.
/// {@endtemplate}
@immutable
class HookDelivery {
  /// {@macro hook_delivery}
  const HookDelivery({
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
    required this.request,
    required this.response,
    this.throttledAt,
    this.url,
  });

  /// Converts a `Map<String, dynamic>` to a [HookDelivery].
  factory HookDelivery.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'HookDelivery',
      json,
      () => HookDelivery(
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
        url: json['url'] as String?,
        request: HookDeliveryRequest.fromJson(
          json['request'] as Map<String, dynamic>,
        ),
        response: HookDeliveryResponse.fromJson(
          json['response'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static HookDelivery? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return HookDelivery.fromJson(json);
  }

  /// Unique identifier of the delivery.
  /// Example: `42`
  final int id;

  /// Unique identifier for the event (shared with all deliveries for all
  /// webhooks that subscribe to this event).
  /// Example: `'58474f00-b361-11eb-836d-0e4f3503ccbe'`
  final String guid;

  /// Time when the delivery was delivered.
  /// Example: `'2021-05-12T20:33:44Z'`
  final DateTime deliveredAt;

  /// Whether the delivery is a redelivery.
  /// Example: `false`
  final bool redelivery;

  /// Time spent delivering.
  /// Example: `0.03`
  final double duration;

  /// Description of the status of the attempted delivery
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

  /// The URL target of the delivery.
  /// Example: `'https://www.example.com'`
  final String? url;
  final HookDeliveryRequest request;
  final HookDeliveryResponse response;

  /// Converts a [HookDelivery] to a `Map<String, dynamic>`.
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
      if (url != null) 'url': url,
      'request': request.toJson(),
      'response': response.toJson(),
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
    url,
    request,
    response,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HookDelivery &&
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
        throttledAt == other.throttledAt &&
        url == other.url &&
        request == other.request &&
        response == other.response;
  }
}
