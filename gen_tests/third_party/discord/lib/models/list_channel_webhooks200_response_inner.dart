// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/application_incoming_webhook_response.dart';
import 'package:discord/messages/channel_follower_webhook_response.dart';
import 'package:discord/messages/guild_incoming_webhook_response.dart';
import 'package:meta/meta.dart';

sealed class ListChannelWebhooks200ResponseInner {
  const ListChannelWebhooks200ResponseInner();

  factory ListChannelWebhooks200ResponseInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      3 =>
        ListChannelWebhooks200ResponseInnerApplicationIncomingWebhookResponse(
          ApplicationIncomingWebhookResponse.fromJson(json),
        ),
      2 => ListChannelWebhooks200ResponseInnerChannelFollowerWebhookResponse(
        ChannelFollowerWebhookResponse.fromJson(json),
      ),
      1 => ListChannelWebhooks200ResponseInnerGuildIncomingWebhookResponse(
        GuildIncomingWebhookResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ListChannelWebhooks200ResponseInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ListChannelWebhooks200ResponseInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ListChannelWebhooks200ResponseInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ListChannelWebhooks200ResponseInnerApplicationIncomingWebhookResponse
    extends ListChannelWebhooks200ResponseInner {
  const ListChannelWebhooks200ResponseInnerApplicationIncomingWebhookResponse(
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
            is ListChannelWebhooks200ResponseInnerApplicationIncomingWebhookResponse &&
        value == other.value;
  }
}

@immutable
final class ListChannelWebhooks200ResponseInnerChannelFollowerWebhookResponse
    extends ListChannelWebhooks200ResponseInner {
  const ListChannelWebhooks200ResponseInnerChannelFollowerWebhookResponse(
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
            is ListChannelWebhooks200ResponseInnerChannelFollowerWebhookResponse &&
        value == other.value;
  }
}

@immutable
final class ListChannelWebhooks200ResponseInnerGuildIncomingWebhookResponse
    extends ListChannelWebhooks200ResponseInner {
  const ListChannelWebhooks200ResponseInnerGuildIncomingWebhookResponse(
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
            is ListChannelWebhooks200ResponseInnerGuildIncomingWebhookResponse &&
        value == other.value;
  }
}
