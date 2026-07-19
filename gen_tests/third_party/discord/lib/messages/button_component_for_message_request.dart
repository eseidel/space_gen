import 'package:discord/messages/component_emoji_for_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/button_style_types.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ButtonComponentForMessageRequest {
  const ButtonComponentForMessageRequest({
    required this.style,
    this.id,
    this.customId,
    this.label,
    this.disabled,
    this.url,
    this.skuId,
    this.emoji,
  });

  /// Converts a `Map<String, dynamic>` to a [ButtonComponentForMessageRequest].
  factory ButtonComponentForMessageRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ButtonComponentForMessageRequest',
      json,
      () => ButtonComponentForMessageRequest(
        id: json['id'] as int?,
        customId: json['custom_id'] as String?,
        style: ButtonStyleTypes.fromJson(json['style'] as int),
        label: json['label'] as String?,
        disabled: json['disabled'] as bool?,
        url: maybeParseUri(json['url'] as String?),
        skuId: SnowflakeType.maybeFromJson(json['sku_id'] as String?),
        emoji: ComponentEmojiForRequest.maybeFromJson(
          json['emoji'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ButtonComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ButtonComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.button;
  final int? id;
  final String? customId;
  final ButtonStyleTypes style;
  final String? label;
  final bool? disabled;
  final Uri? url;
  final SnowflakeType? skuId;
  final ComponentEmojiForRequest? emoji;

  /// Converts a [ButtonComponentForMessageRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'style': style.toJson(),
      'label': label,
      'disabled': disabled,
      'url': url?.toString(),
      'sku_id': skuId?.toJson(),
      'emoji': emoji?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, customId, style, label, disabled, url, skuId, emoji]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ButtonComponentForMessageRequest &&
        id == other.id &&
        customId == other.customId &&
        style == other.style &&
        label == other.label &&
        disabled == other.disabled &&
        url == other.url &&
        skuId == other.skuId &&
        emoji == other.emoji;
  }
}
