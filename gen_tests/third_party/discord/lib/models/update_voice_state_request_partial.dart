// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateVoiceStateRequestPartial {
  const UpdateVoiceStateRequestPartial({this.suppress, this.channelId});

  /// Converts a `Map<String, dynamic>` to a [UpdateVoiceStateRequestPartial].
  factory UpdateVoiceStateRequestPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateVoiceStateRequestPartial',
      json,
      () => UpdateVoiceStateRequestPartial(
        suppress: json['suppress'] as bool?,
        channelId: SnowflakeType.maybeFromJson(json['channel_id'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateVoiceStateRequestPartial? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateVoiceStateRequestPartial.fromJson(json);
  }

  final bool? suppress;
  final SnowflakeType? channelId;

  /// Converts a [UpdateVoiceStateRequestPartial] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'suppress': suppress, 'channel_id': channelId?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([suppress, channelId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateVoiceStateRequestPartial &&
        suppress == other.suppress &&
        channelId == other.channelId;
  }
}
