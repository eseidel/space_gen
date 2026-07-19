import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActivitySetThreadSubscriptionRequest {
  const ActivitySetThreadSubscriptionRequest({this.ignored = false});

  /// Converts a `Map<String, dynamic>` to an
  /// [ActivitySetThreadSubscriptionRequest].
  factory ActivitySetThreadSubscriptionRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActivitySetThreadSubscriptionRequest',
      json,
      () => ActivitySetThreadSubscriptionRequest(
        ignored: (json['ignored'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActivitySetThreadSubscriptionRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActivitySetThreadSubscriptionRequest.fromJson(json);
  }

  /// Whether to block all notifications from a thread.
  final bool? ignored;

  /// Converts an [ActivitySetThreadSubscriptionRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'ignored': ignored};
  }

  @override
  int get hashCode => ignored.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivitySetThreadSubscriptionRequest &&
        ignored == other.ignored;
  }
}
