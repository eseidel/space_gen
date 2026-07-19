import 'package:discord/messages/guild_channel_response.dart';
import 'package:discord/messages/private_channel_response.dart';
import 'package:discord/messages/private_group_channel_response.dart';
import 'package:discord/messages/thread_response.dart';
import 'package:meta/meta.dart';

sealed class GetChannel200Response {
  const GetChannel200Response();

  factory GetChannel200Response.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('position')) {
      return GetChannel200ResponseGuildChannelResponse(
        GuildChannelResponse.fromJson(json),
      );
    }
    if (json.containsKey('icon')) {
      return GetChannel200ResponsePrivateGroupChannelResponse(
        PrivateGroupChannelResponse.fromJson(json),
      );
    }
    if (json.containsKey('member_count')) {
      return GetChannel200ResponseThreadResponse(ThreadResponse.fromJson(json));
    }
    return GetChannel200ResponsePrivateChannelResponse(
      PrivateChannelResponse.fromJson(json),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetChannel200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetChannel200Response.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class GetChannel200ResponseGuildChannelResponse
    extends GetChannel200Response {
  const GetChannel200ResponseGuildChannelResponse(this.value);

  final GuildChannelResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetChannel200ResponseGuildChannelResponse &&
        value == other.value;
  }
}

@immutable
final class GetChannel200ResponsePrivateChannelResponse
    extends GetChannel200Response {
  const GetChannel200ResponsePrivateChannelResponse(this.value);

  final PrivateChannelResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetChannel200ResponsePrivateChannelResponse &&
        value == other.value;
  }
}

@immutable
final class GetChannel200ResponsePrivateGroupChannelResponse
    extends GetChannel200Response {
  const GetChannel200ResponsePrivateGroupChannelResponse(this.value);

  final PrivateGroupChannelResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetChannel200ResponsePrivateGroupChannelResponse &&
        value == other.value;
  }
}

@immutable
final class GetChannel200ResponseThreadResponse extends GetChannel200Response {
  const GetChannel200ResponseThreadResponse(this.value);

  final ThreadResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetChannel200ResponseThreadResponse && value == other.value;
  }
}
