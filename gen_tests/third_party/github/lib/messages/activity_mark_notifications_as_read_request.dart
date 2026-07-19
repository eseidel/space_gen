import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActivityMarkNotificationsAsReadRequest {
  const ActivityMarkNotificationsAsReadRequest({this.lastReadAt, this.read});

  /// Converts a `Map<String, dynamic>` to an
  /// [ActivityMarkNotificationsAsReadRequest].
  factory ActivityMarkNotificationsAsReadRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActivityMarkNotificationsAsReadRequest',
      json,
      () => ActivityMarkNotificationsAsReadRequest(
        lastReadAt: maybeParseDateTime(json['last_read_at'] as String?),
        read: json['read'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActivityMarkNotificationsAsReadRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActivityMarkNotificationsAsReadRequest.fromJson(json);
  }

  /// Describes the last point that notifications were checked. Anything
  /// updated since this time will not be marked as read. If you omit this
  /// parameter, all notifications are marked as read. This is a timestamp in
  /// [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`. Default: The current timestamp.
  final DateTime? lastReadAt;

  /// Whether the notification has been read.
  final bool? read;

  /// Converts an [ActivityMarkNotificationsAsReadRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (lastReadAt != null) 'last_read_at': lastReadAt?.toIso8601String(),
      if (read != null) 'read': read,
    };
  }

  @override
  int get hashCode => Object.hashAll([lastReadAt, read]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivityMarkNotificationsAsReadRequest &&
        lastReadAt == other.lastReadAt &&
        read == other.read;
  }
}
