import 'package:discord/messages/guild_template_snapshot_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class GuildTemplateResponse {
  const GuildTemplateResponse({
    required this.code,
    required this.name,
    required this.description,
    required this.usageCount,
    required this.creatorId,
    required this.creator,
    required this.createdAt,
    required this.updatedAt,
    required this.sourceGuildId,
    required this.serializedSourceGuild,
    required this.isDirty,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildTemplateResponse].
  factory GuildTemplateResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildTemplateResponse',
      json,
      () => GuildTemplateResponse(
        code: json['code'] as String,
        name: json['name'] as String,
        description: checkedKey(json, 'description') as String?,
        usageCount: json['usage_count'] as int,
        creatorId: SnowflakeType.fromJson(json['creator_id'] as String),
        creator: UserResponse.maybeFromJson(
          checkedKey(json, 'creator') as Map<String, dynamic>?,
        ),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        sourceGuildId: SnowflakeType.fromJson(
          json['source_guild_id'] as String,
        ),
        serializedSourceGuild: GuildTemplateSnapshotResponse.fromJson(
          json['serialized_source_guild'] as Map<String, dynamic>,
        ),
        isDirty: checkedKey(json, 'is_dirty') as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildTemplateResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildTemplateResponse.fromJson(json);
  }

  final String code;
  final String name;
  final String? description;
  final int usageCount;
  final SnowflakeType creatorId;
  final UserResponse? creator;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SnowflakeType sourceGuildId;
  final GuildTemplateSnapshotResponse serializedSourceGuild;
  final bool? isDirty;

  /// Converts a [GuildTemplateResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'description': description,
      'usage_count': usageCount,
      'creator_id': creatorId.toJson(),
      'creator': creator?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'source_guild_id': sourceGuildId.toJson(),
      'serialized_source_guild': serializedSourceGuild.toJson(),
      'is_dirty': isDirty,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    code,
    name,
    description,
    usageCount,
    creatorId,
    creator,
    createdAt,
    updatedAt,
    sourceGuildId,
    serializedSourceGuild,
    isDirty,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildTemplateResponse &&
        code == other.code &&
        name == other.name &&
        description == other.description &&
        usageCount == other.usageCount &&
        creatorId == other.creatorId &&
        creator == other.creator &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        sourceGuildId == other.sourceGuildId &&
        serializedSourceGuild == other.serializedSourceGuild &&
        isDirty == other.isDirty;
  }
}
