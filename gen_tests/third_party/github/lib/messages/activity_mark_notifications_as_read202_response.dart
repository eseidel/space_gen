import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActivityMarkNotificationsAsRead202Response {
  const ActivityMarkNotificationsAsRead202Response({this.message});

  /// Converts a `Map<String, dynamic>` to an
  /// [ActivityMarkNotificationsAsRead202Response].
  factory ActivityMarkNotificationsAsRead202Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActivityMarkNotificationsAsRead202Response',
      json,
      () => ActivityMarkNotificationsAsRead202Response(
        message: json['message'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActivityMarkNotificationsAsRead202Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActivityMarkNotificationsAsRead202Response.fromJson(json);
  }

  final String? message;

  /// Converts an [ActivityMarkNotificationsAsRead202Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (message != null) 'message': message};
  }

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivityMarkNotificationsAsRead202Response &&
        message == other.message;
  }
}
