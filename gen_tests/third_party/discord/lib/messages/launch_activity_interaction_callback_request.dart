import 'package:discord/model_helpers.dart';
import 'package:discord/models/interaction_callback_types.dart';
import 'package:meta/meta.dart';

@immutable
class LaunchActivityInteractionCallbackRequest {
  const LaunchActivityInteractionCallbackRequest();

  /// Converts a `Map<String, dynamic>` to a
  /// [LaunchActivityInteractionCallbackRequest].
  factory LaunchActivityInteractionCallbackRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'LaunchActivityInteractionCallbackRequest',
      json,
      LaunchActivityInteractionCallbackRequest.new,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LaunchActivityInteractionCallbackRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return LaunchActivityInteractionCallbackRequest.fromJson(json);
  }

  InteractionCallbackTypes get type => InteractionCallbackTypes.launchActivity;

  /// Converts a [LaunchActivityInteractionCallbackRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LaunchActivityInteractionCallbackRequest;
  }
}
