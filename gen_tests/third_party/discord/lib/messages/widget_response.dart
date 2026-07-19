import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/widget_channel.dart';
import 'package:discord/models/widget_member.dart';
import 'package:meta/meta.dart';

@immutable
class WidgetResponse {
  const WidgetResponse({
    required this.id,
    required this.name,
    required this.instantInvite,
    required this.channels,
    required this.members,
    required this.presenceCount,
  });

  /// Converts a `Map<String, dynamic>` to a [WidgetResponse].
  factory WidgetResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WidgetResponse',
      json,
      () => WidgetResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        instantInvite: checkedKey(json, 'instant_invite') as String?,
        channels: (json['channels'] as List)
            .map<WidgetChannel>(
              (e) => WidgetChannel.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        members: (json['members'] as List)
            .map<WidgetMember>(
              (e) => WidgetMember.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        presenceCount: json['presence_count'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WidgetResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WidgetResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final String? instantInvite;
  final List<WidgetChannel> channels;
  final List<WidgetMember> members;
  final int presenceCount;

  /// Converts a [WidgetResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'instant_invite': instantInvite,
      'channels': channels.map((e) => e.toJson()).toList(),
      'members': members.map((e) => e.toJson()).toList(),
      'presence_count': presenceCount,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    instantInvite,
    listHash(channels),
    listHash(members),
    presenceCount,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WidgetResponse &&
        id == other.id &&
        name == other.name &&
        instantInvite == other.instantInvite &&
        listsEqual(channels, other.channels) &&
        listsEqual(members, other.members) &&
        presenceCount == other.presenceCount;
  }
}
