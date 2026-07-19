import 'package:discord/messages/invite_channel_recipient_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class InviteChannelResponse {
  const InviteChannelResponse({
    required this.id,
    required this.type,
    required this.name,
    this.icon,
    this.recipients,
  });

  /// Converts a `Map<String, dynamic>` to an [InviteChannelResponse].
  factory InviteChannelResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InviteChannelResponse',
      json,
      () => InviteChannelResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        type: ChannelTypes.fromJson(json['type'] as int),
        name: checkedKey(json, 'name') as String?,
        icon: json['icon'] as String?,
        recipients: (json['recipients'] as List?)
            ?.map<InviteChannelRecipientResponse>(
              (e) => InviteChannelRecipientResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InviteChannelResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InviteChannelResponse.fromJson(json);
  }

  final SnowflakeType id;
  final ChannelTypes type;
  final String? name;
  final String? icon;
  final List<InviteChannelRecipientResponse>? recipients;

  /// Converts an [InviteChannelResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type.toJson(),
      'name': name,
      'icon': ?icon,
      'recipients': ?recipients?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, type, name, icon, listHash(recipients)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InviteChannelResponse &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        icon == other.icon &&
        listsEqual(recipients, other.recipients);
  }
}
