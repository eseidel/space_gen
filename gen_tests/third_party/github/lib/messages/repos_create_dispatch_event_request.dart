import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateDispatchEventRequest {
  const ReposCreateDispatchEventRequest({
    required this.eventType,
    this.clientPayload,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposCreateDispatchEventRequest].
  factory ReposCreateDispatchEventRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreateDispatchEventRequest',
      json,
      () => ReposCreateDispatchEventRequest(
        eventType: json['event_type'] as String,
        clientPayload: json['client_payload'] as Map<String, dynamic>?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateDispatchEventRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateDispatchEventRequest.fromJson(json);
  }

  /// A custom webhook event name. Must be 100 characters or fewer.
  final String eventType;

  /// JSON payload with extra information about the webhook event that your
  /// action or workflow may use. The maximum number of top-level properties
  /// is 10. The total size of the JSON payload must be less than 64KB.
  final Map<String, dynamic>? clientPayload;

  /// Converts a [ReposCreateDispatchEventRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'event_type': eventType, 'client_payload': clientPayload};
  }

  @override
  int get hashCode => Object.hashAll([eventType, mapHash(clientPayload)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateDispatchEventRequest &&
        eventType == other.eventType &&
        mapsEqual(clientPayload, other.clientPayload);
  }
}
