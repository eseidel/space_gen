import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateGuildWidgetSettingsRequest {
  const UpdateGuildWidgetSettingsRequest({this.channelId, this.enabled});

  /// Converts a `Map<String, dynamic>` to a [UpdateGuildWidgetSettingsRequest].
  factory UpdateGuildWidgetSettingsRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateGuildWidgetSettingsRequest',
      json,
      () => UpdateGuildWidgetSettingsRequest(
        channelId: SnowflakeType.maybeFromJson(json['channel_id'] as String?),
        enabled: json['enabled'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateGuildWidgetSettingsRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateGuildWidgetSettingsRequest.fromJson(json);
  }

  final SnowflakeType? channelId;
  final bool? enabled;

  /// Converts a [UpdateGuildWidgetSettingsRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'channel_id': channelId?.toJson(), 'enabled': enabled};
  }

  @override
  int get hashCode => Object.hashAll([channelId, enabled]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateGuildWidgetSettingsRequest &&
        channelId == other.channelId &&
        enabled == other.enabled;
  }
}
