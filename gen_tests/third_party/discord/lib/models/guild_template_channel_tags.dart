import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class GuildTemplateChannelTags {
  const GuildTemplateChannelTags({
    required this.id,
    required this.name,
    required this.emojiId,
    required this.emojiName,
    required this.moderated,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildTemplateChannelTags].
  factory GuildTemplateChannelTags.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildTemplateChannelTags',
      json,
      () => GuildTemplateChannelTags(
        id: checkedKey(json, 'id') as int?,
        name: json['name'] as String,
        emojiId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'emoji_id') as String?,
        ),
        emojiName: checkedKey(json, 'emoji_name') as String?,
        moderated: checkedKey(json, 'moderated') as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildTemplateChannelTags? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildTemplateChannelTags.fromJson(json);
  }

  final int? id;
  final String name;
  final SnowflakeType? emojiId;
  final String? emojiName;
  final bool? moderated;

  /// Converts a [GuildTemplateChannelTags] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'emoji_id': emojiId?.toJson(),
      'emoji_name': emojiName,
      'moderated': moderated,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, name, emojiId, emojiName, moderated]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildTemplateChannelTags &&
        id == other.id &&
        name == other.name &&
        emojiId == other.emojiId &&
        emojiName == other.emojiName &&
        moderated == other.moderated;
  }
}
