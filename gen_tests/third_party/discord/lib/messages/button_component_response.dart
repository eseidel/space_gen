import 'package:discord/messages/component_emoji_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/button_style_types.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ButtonComponentResponse {
  const ButtonComponentResponse({
    required this.id,
    required this.style,
    this.customId,
    this.label,
    this.disabled,
    this.emoji,
    this.url,
    this.skuId,
  });

  /// Converts a `Map<String, dynamic>` to a [ButtonComponentResponse].
  factory ButtonComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ButtonComponentResponse',
      json,
      () => ButtonComponentResponse(
        id: json['id'] as int,
        customId: json['custom_id'] as String?,
        style: ButtonStyleTypes.fromJson(json['style'] as int),
        label: json['label'] as String?,
        disabled: json['disabled'] as bool?,
        emoji: ComponentEmojiResponse.maybeFromJson(
          json['emoji'] as Map<String, dynamic>?,
        ),
        url: maybeParseUri(json['url'] as String?),
        skuId: SnowflakeType.maybeFromJson(json['sku_id'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ButtonComponentResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ButtonComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.button;
  final int id;
  final String? customId;
  final ButtonStyleTypes style;
  final String? label;
  final bool? disabled;
  final ComponentEmojiResponse? emoji;
  final Uri? url;
  final SnowflakeType? skuId;

  /// Converts a [ButtonComponentResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'style': style.toJson(),
      'label': label,
      'disabled': disabled,
      'emoji': emoji?.toJson(),
      'url': url?.toString(),
      'sku_id': skuId?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, customId, style, label, disabled, emoji, url, skuId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ButtonComponentResponse &&
        id == other.id &&
        customId == other.customId &&
        style == other.style &&
        label == other.label &&
        disabled == other.disabled &&
        emoji == other.emoji &&
        url == other.url &&
        skuId == other.skuId;
  }
}
