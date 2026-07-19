// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/application_incoming_webhook_response.dart';
import 'package:discord/messages/channel_follower_webhook_response.dart';
import 'package:discord/messages/guild_incoming_webhook_response.dart';
import 'package:meta/meta.dart';

sealed class GuildAuditLogResponseWebhooksInner {
  const GuildAuditLogResponseWebhooksInner();

  factory GuildAuditLogResponseWebhooksInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      3 => GuildAuditLogResponseWebhooksInnerApplicationIncomingWebhookResponse(
        ApplicationIncomingWebhookResponse.fromJson(json),
      ),
      2 => GuildAuditLogResponseWebhooksInnerChannelFollowerWebhookResponse(
        ChannelFollowerWebhookResponse.fromJson(json),
      ),
      1 => GuildAuditLogResponseWebhooksInnerGuildIncomingWebhookResponse(
        GuildIncomingWebhookResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for GuildAuditLogResponseWebhooksInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildAuditLogResponseWebhooksInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GuildAuditLogResponseWebhooksInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class GuildAuditLogResponseWebhooksInnerApplicationIncomingWebhookResponse
    extends GuildAuditLogResponseWebhooksInner {
  const GuildAuditLogResponseWebhooksInnerApplicationIncomingWebhookResponse(
    this.value,
  );

  final ApplicationIncomingWebhookResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is GuildAuditLogResponseWebhooksInnerApplicationIncomingWebhookResponse &&
        value == other.value;
  }
}

@immutable
final class GuildAuditLogResponseWebhooksInnerChannelFollowerWebhookResponse
    extends GuildAuditLogResponseWebhooksInner {
  const GuildAuditLogResponseWebhooksInnerChannelFollowerWebhookResponse(
    this.value,
  );

  final ChannelFollowerWebhookResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is GuildAuditLogResponseWebhooksInnerChannelFollowerWebhookResponse &&
        value == other.value;
  }
}

@immutable
final class GuildAuditLogResponseWebhooksInnerGuildIncomingWebhookResponse
    extends GuildAuditLogResponseWebhooksInner {
  const GuildAuditLogResponseWebhooksInnerGuildIncomingWebhookResponse(
    this.value,
  );

  final GuildIncomingWebhookResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is GuildAuditLogResponseWebhooksInnerGuildIncomingWebhookResponse &&
        value == other.value;
  }
}
