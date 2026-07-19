import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_permission_overwrites.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ChannelPermissionOverwriteRequest {
  const ChannelPermissionOverwriteRequest({
    required this.id,
    this.type,
    this.allow,
    this.deny,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ChannelPermissionOverwriteRequest].
  factory ChannelPermissionOverwriteRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ChannelPermissionOverwriteRequest',
      json,
      () => ChannelPermissionOverwriteRequest(
        id: SnowflakeType.fromJson(json['id'] as String),
        type: ChannelPermissionOverwrites.maybeFromJson(json['type'] as int?),
        allow: json['allow'] as int?,
        deny: json['deny'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChannelPermissionOverwriteRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChannelPermissionOverwriteRequest.fromJson(json);
  }

  final SnowflakeType id;
  final ChannelPermissionOverwrites? type;
  final int? allow;
  final int? deny;

  /// Converts a [ChannelPermissionOverwriteRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type?.toJson(),
      'allow': allow,
      'deny': deny,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, type, allow, deny]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChannelPermissionOverwriteRequest &&
        id == other.id &&
        type == other.type &&
        allow == other.allow &&
        deny == other.deny;
  }
}
