import 'package:discord/messages/guild_channel_response.dart';
import 'package:discord/messages/private_channel_response.dart';
import 'package:discord/messages/private_group_channel_response.dart';
import 'package:discord/messages/thread_response.dart';
import 'package:meta/meta.dart';

sealed class ResolvedObjectsResponseChannels {
  const ResolvedObjectsResponseChannels();

  factory ResolvedObjectsResponseChannels.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('position')) {
      return ResolvedObjectsResponseChannelsGuildChannelResponse(
        GuildChannelResponse.fromJson(json),
      );
    }
    if (json.containsKey('icon')) {
      return ResolvedObjectsResponseChannelsPrivateGroupChannelResponse(
        PrivateGroupChannelResponse.fromJson(json),
      );
    }
    if (json.containsKey('member_count')) {
      return ResolvedObjectsResponseChannelsThreadResponse(
        ThreadResponse.fromJson(json),
      );
    }
    return ResolvedObjectsResponseChannelsPrivateChannelResponse(
      PrivateChannelResponse.fromJson(json),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ResolvedObjectsResponseChannels? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ResolvedObjectsResponseChannels.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ResolvedObjectsResponseChannelsGuildChannelResponse
    extends ResolvedObjectsResponseChannels {
  const ResolvedObjectsResponseChannelsGuildChannelResponse(this.value);

  final GuildChannelResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ResolvedObjectsResponseChannelsGuildChannelResponse &&
        value == other.value;
  }
}

@immutable
final class ResolvedObjectsResponseChannelsPrivateChannelResponse
    extends ResolvedObjectsResponseChannels {
  const ResolvedObjectsResponseChannelsPrivateChannelResponse(this.value);

  final PrivateChannelResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ResolvedObjectsResponseChannelsPrivateChannelResponse &&
        value == other.value;
  }
}

@immutable
final class ResolvedObjectsResponseChannelsPrivateGroupChannelResponse
    extends ResolvedObjectsResponseChannels {
  const ResolvedObjectsResponseChannelsPrivateGroupChannelResponse(this.value);

  final PrivateGroupChannelResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ResolvedObjectsResponseChannelsPrivateGroupChannelResponse &&
        value == other.value;
  }
}

@immutable
final class ResolvedObjectsResponseChannelsThreadResponse
    extends ResolvedObjectsResponseChannels {
  const ResolvedObjectsResponseChannelsThreadResponse(this.value);

  final ThreadResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ResolvedObjectsResponseChannelsThreadResponse &&
        value == other.value;
  }
}
