import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_permission_overwrites.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ChannelPermissionOverwriteResponse {
  const ChannelPermissionOverwriteResponse({
    required this.id,
    required this.type,
    required this.allow,
    required this.deny,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ChannelPermissionOverwriteResponse].
  factory ChannelPermissionOverwriteResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ChannelPermissionOverwriteResponse',
      json,
      () => ChannelPermissionOverwriteResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        type: ChannelPermissionOverwrites.fromJson(json['type'] as int),
        allow: json['allow'] as String,
        deny: json['deny'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChannelPermissionOverwriteResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChannelPermissionOverwriteResponse.fromJson(json);
  }

  final SnowflakeType id;
  final ChannelPermissionOverwrites type;
  final String allow;
  final String deny;

  /// Converts a [ChannelPermissionOverwriteResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type.toJson(),
      'allow': allow,
      'deny': deny,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, type, allow, deny]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChannelPermissionOverwriteResponse &&
        id == other.id &&
        type == other.type &&
        allow == other.allow &&
        deny == other.deny;
  }
}
