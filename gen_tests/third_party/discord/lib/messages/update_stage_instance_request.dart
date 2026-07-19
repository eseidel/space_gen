import 'package:discord/model_helpers.dart';
import 'package:discord/models/stage_instances_privacy_levels.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateStageInstanceRequest {
  const UpdateStageInstanceRequest({this.topic, this.privacyLevel});

  /// Converts a `Map<String, dynamic>` to a [UpdateStageInstanceRequest].
  factory UpdateStageInstanceRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateStageInstanceRequest',
      json,
      () => UpdateStageInstanceRequest(
        topic: json['topic'] as String?,
        privacyLevel: StageInstancesPrivacyLevels.maybeFromJson(
          json['privacy_level'] as int?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateStageInstanceRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdateStageInstanceRequest.fromJson(json);
  }

  final String? topic;
  final StageInstancesPrivacyLevels? privacyLevel;

  /// Converts a [UpdateStageInstanceRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'topic': topic, 'privacy_level': privacyLevel?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([topic, privacyLevel]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateStageInstanceRequest &&
        topic == other.topic &&
        privacyLevel == other.privacyLevel;
  }
}
