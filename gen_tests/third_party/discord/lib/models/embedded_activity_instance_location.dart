import 'package:discord/model_helpers.dart';
import 'package:discord/models/embedded_activity_location_kind.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class EmbeddedActivityInstanceLocation {
  const EmbeddedActivityInstanceLocation();

  factory EmbeddedActivityInstanceLocation.fromJson(Map<String, dynamic> json) {
    final discriminator = json['kind'];
    return switch (discriminator) {
      'gc' => GuildChannelLocation.fromJson(json),
      'pc' => PrivateChannelLocation.fromJson(json),
      _ => throw FormatException(
        "Unknown kind '$discriminator' for EmbeddedActivityInstanceLocation",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EmbeddedActivityInstanceLocation? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EmbeddedActivityInstanceLocation.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class GuildChannelLocation extends EmbeddedActivityInstanceLocation {
  const GuildChannelLocation({
    required this.id,
    required this.channelId,
    required this.guildId,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildChannelLocation].
  factory GuildChannelLocation.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildChannelLocation',
      json,
      () => GuildChannelLocation(
        id: json['id'] as String,
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
        guildId: SnowflakeType.fromJson(json['guild_id'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildChannelLocation? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildChannelLocation.fromJson(json);
  }

  final String id;
  EmbeddedActivityLocationKind get kind =>
      EmbeddedActivityLocationKind.guildChannel;
  final SnowflakeType channelId;
  final SnowflakeType guildId;

  /// Converts a [GuildChannelLocation] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kind': kind.toJson(),
      'channel_id': channelId.toJson(),
      'guild_id': guildId.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, channelId, guildId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildChannelLocation &&
        id == other.id &&
        channelId == other.channelId &&
        guildId == other.guildId;
  }
}

@immutable
final class PrivateChannelLocation extends EmbeddedActivityInstanceLocation {
  const PrivateChannelLocation({required this.id, required this.channelId});

  /// Converts a `Map<String, dynamic>` to a [PrivateChannelLocation].
  factory PrivateChannelLocation.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PrivateChannelLocation',
      json,
      () => PrivateChannelLocation(
        id: json['id'] as String,
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PrivateChannelLocation? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PrivateChannelLocation.fromJson(json);
  }

  final String id;
  EmbeddedActivityLocationKind get kind =>
      EmbeddedActivityLocationKind.privateChannel;
  final SnowflakeType channelId;

  /// Converts a [PrivateChannelLocation] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'kind': kind.toJson(), 'channel_id': channelId.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([id, channelId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PrivateChannelLocation &&
        id == other.id &&
        channelId == other.channelId;
  }
}
