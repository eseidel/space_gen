import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class PrivateGroupChannelResponse {
  const PrivateGroupChannelResponse({
    required this.id,
    required this.flags,
    required this.recipients,
    required this.name,
    required this.icon,
    required this.ownerId,
    this.lastMessageId,
    this.lastPinTimestamp,
    this.managed,
    this.applicationId,
  });

  /// Converts a `Map<String, dynamic>` to a [PrivateGroupChannelResponse].
  factory PrivateGroupChannelResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PrivateGroupChannelResponse',
      json,
      () => PrivateGroupChannelResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        lastMessageId: SnowflakeType.maybeFromJson(
          json['last_message_id'] as String?,
        ),
        flags: json['flags'] as int,
        lastPinTimestamp: maybeParseDateTime(
          json['last_pin_timestamp'] as String?,
        ),
        recipients: (json['recipients'] as List)
            .map<UserResponse>(
              (e) => UserResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        name: checkedKey(json, 'name') as String?,
        icon: checkedKey(json, 'icon') as String?,
        ownerId: SnowflakeType.fromJson(json['owner_id'] as String),
        managed: json['managed'] as bool?,
        applicationId: SnowflakeType.maybeFromJson(
          json['application_id'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PrivateGroupChannelResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PrivateGroupChannelResponse.fromJson(json);
  }

  final SnowflakeType id;
  ChannelTypes get type => ChannelTypes.groupDm;
  final SnowflakeType? lastMessageId;
  final int flags;
  final DateTime? lastPinTimestamp;
  final List<UserResponse> recipients;
  final String? name;
  final String? icon;
  final SnowflakeType ownerId;
  final bool? managed;
  final SnowflakeType? applicationId;

  /// Converts a [PrivateGroupChannelResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type.toJson(),
      'last_message_id': lastMessageId?.toJson(),
      'flags': flags,
      'last_pin_timestamp': lastPinTimestamp?.toIso8601String(),
      'recipients': recipients.map((e) => e.toJson()).toList(),
      'name': name,
      'icon': icon,
      'owner_id': ownerId.toJson(),
      'managed': ?managed,
      'application_id': ?applicationId?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    lastMessageId,
    flags,
    lastPinTimestamp,
    listHash(recipients),
    name,
    icon,
    ownerId,
    managed,
    applicationId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PrivateGroupChannelResponse &&
        id == other.id &&
        lastMessageId == other.lastMessageId &&
        flags == other.flags &&
        lastPinTimestamp == other.lastPinTimestamp &&
        listsEqual(recipients, other.recipients) &&
        name == other.name &&
        icon == other.icon &&
        ownerId == other.ownerId &&
        managed == other.managed &&
        applicationId == other.applicationId;
  }
}
