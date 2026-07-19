import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActivityMarkRepoNotificationsAsRead202Response {
  const ActivityMarkRepoNotificationsAsRead202Response({
    this.message,
    this.url,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActivityMarkRepoNotificationsAsRead202Response].
  factory ActivityMarkRepoNotificationsAsRead202Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActivityMarkRepoNotificationsAsRead202Response',
      json,
      () => ActivityMarkRepoNotificationsAsRead202Response(
        message: json['message'] as String?,
        url: json['url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActivityMarkRepoNotificationsAsRead202Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActivityMarkRepoNotificationsAsRead202Response.fromJson(json);
  }

  final String? message;
  final String? url;

  /// Converts an [ActivityMarkRepoNotificationsAsRead202Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'message': ?message, 'url': ?url};
  }

  @override
  int get hashCode => Object.hashAll([message, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivityMarkRepoNotificationsAsRead202Response &&
        message == other.message &&
        url == other.url;
  }
}
