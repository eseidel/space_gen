import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActivityMarkRepoNotificationsAsReadRequest {
  const ActivityMarkRepoNotificationsAsReadRequest({this.lastReadAt});

  /// Converts a `Map<String, dynamic>` to an
  /// [ActivityMarkRepoNotificationsAsReadRequest].
  factory ActivityMarkRepoNotificationsAsReadRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActivityMarkRepoNotificationsAsReadRequest',
      json,
      () => ActivityMarkRepoNotificationsAsReadRequest(
        lastReadAt: maybeParseDateTime(json['last_read_at'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActivityMarkRepoNotificationsAsReadRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActivityMarkRepoNotificationsAsReadRequest.fromJson(json);
  }

  /// Describes the last point that notifications were checked. Anything
  /// updated since this time will not be marked as read. If you omit this
  /// parameter, all notifications are marked as read. This is a timestamp in
  /// [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`. Default: The current timestamp.
  final DateTime? lastReadAt;

  /// Converts an [ActivityMarkRepoNotificationsAsReadRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (lastReadAt != null) 'last_read_at': lastReadAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode => lastReadAt.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivityMarkRepoNotificationsAsReadRequest &&
        lastReadAt == other.lastReadAt;
  }
}
