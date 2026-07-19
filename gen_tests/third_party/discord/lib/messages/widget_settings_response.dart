import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class WidgetSettingsResponse {
  const WidgetSettingsResponse({
    required this.enabled,
    required this.channelId,
  });

  /// Converts a `Map<String, dynamic>` to a [WidgetSettingsResponse].
  factory WidgetSettingsResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WidgetSettingsResponse',
      json,
      () => WidgetSettingsResponse(
        enabled: json['enabled'] as bool,
        channelId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'channel_id') as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WidgetSettingsResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WidgetSettingsResponse.fromJson(json);
  }

  final bool enabled;
  final SnowflakeType? channelId;

  /// Converts a [WidgetSettingsResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enabled': enabled, 'channel_id': channelId?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([enabled, channelId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WidgetSettingsResponse &&
        enabled == other.enabled &&
        channelId == other.channelId;
  }
}
