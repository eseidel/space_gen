// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActivitySetRepoSubscriptionRequest {
  const ActivitySetRepoSubscriptionRequest({this.subscribed, this.ignored});

  /// Converts a `Map<String, dynamic>` to an
  /// [ActivitySetRepoSubscriptionRequest].
  factory ActivitySetRepoSubscriptionRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActivitySetRepoSubscriptionRequest',
      json,
      () => ActivitySetRepoSubscriptionRequest(
        subscribed: json['subscribed'] as bool?,
        ignored: json['ignored'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActivitySetRepoSubscriptionRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActivitySetRepoSubscriptionRequest.fromJson(json);
  }

  /// Determines if notifications should be received from this repository.
  final bool? subscribed;

  /// Determines if all notifications should be blocked from this repository.
  final bool? ignored;

  /// Converts an [ActivitySetRepoSubscriptionRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'subscribed': ?subscribed, 'ignored': ?ignored};
  }

  @override
  int get hashCode => Object.hashAll([subscribed, ignored]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivitySetRepoSubscriptionRequest &&
        subscribed == other.subscribed &&
        ignored == other.ignored;
  }
}
