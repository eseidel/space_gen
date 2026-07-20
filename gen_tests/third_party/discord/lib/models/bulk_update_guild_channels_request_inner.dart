import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class BulkUpdateGuildChannelsRequestInner {
  BulkUpdateGuildChannelsRequestInner({
    this.id,
    this.position,
    this.parentId,
    this.lockPermissions,
  }) {
    position?.validate(min: 0);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [BulkUpdateGuildChannelsRequestInner].
  factory BulkUpdateGuildChannelsRequestInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'BulkUpdateGuildChannelsRequestInner',
      json,
      () => BulkUpdateGuildChannelsRequestInner(
        id: SnowflakeType.maybeFromJson(json['id'] as String?),
        position: json['position'] as int?,
        parentId: SnowflakeType.maybeFromJson(json['parent_id'] as String?),
        lockPermissions: json['lock_permissions'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BulkUpdateGuildChannelsRequestInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BulkUpdateGuildChannelsRequestInner.fromJson(json);
  }

  final SnowflakeType? id;
  final int? position;
  final SnowflakeType? parentId;
  final bool? lockPermissions;

  /// Converts a [BulkUpdateGuildChannelsRequestInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toJson(),
      'position': position,
      'parent_id': parentId?.toJson(),
      'lock_permissions': lockPermissions,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, position, parentId, lockPermissions]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BulkUpdateGuildChannelsRequestInner &&
        id == other.id &&
        position == other.position &&
        parentId == other.parentId &&
        lockPermissions == other.lockPermissions;
  }
}
