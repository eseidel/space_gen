import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class PrivateChannelResponse {
  const PrivateChannelResponse({
    required this.id,
    required this.flags,
    required this.recipients,
    this.lastMessageId,
    this.lastPinTimestamp,
  });

  /// Converts a `Map<String, dynamic>` to a [PrivateChannelResponse].
  factory PrivateChannelResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PrivateChannelResponse',
      json,
      () => PrivateChannelResponse(
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
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PrivateChannelResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PrivateChannelResponse.fromJson(json);
  }

  final SnowflakeType id;
  ChannelTypes get type => ChannelTypes.dm;
  final SnowflakeType? lastMessageId;
  final int flags;
  final DateTime? lastPinTimestamp;
  final List<UserResponse> recipients;

  /// Converts a [PrivateChannelResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type.toJson(),
      'last_message_id': lastMessageId?.toJson(),
      'flags': flags,
      'last_pin_timestamp': lastPinTimestamp?.toIso8601String(),
      'recipients': recipients.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    lastMessageId,
    flags,
    lastPinTimestamp,
    listHash(recipients),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PrivateChannelResponse &&
        id == other.id &&
        lastMessageId == other.lastMessageId &&
        flags == other.flags &&
        lastPinTimestamp == other.lastPinTimestamp &&
        listsEqual(recipients, other.recipients);
  }
}
