import 'package:discord/messages/component_emoji_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class StringSelectOptionResponse {
  const StringSelectOptionResponse({
    required this.label,
    required this.value,
    this.description,
    this.emoji,
    this.default_,
  });

  /// Converts a `Map<String, dynamic>` to a [StringSelectOptionResponse].
  factory StringSelectOptionResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StringSelectOptionResponse',
      json,
      () => StringSelectOptionResponse(
        label: json['label'] as String,
        value: json['value'] as String,
        description: json['description'] as String?,
        emoji: ComponentEmojiResponse.maybeFromJson(
          json['emoji'] as Map<String, dynamic>?,
        ),
        default_: json['default'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StringSelectOptionResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return StringSelectOptionResponse.fromJson(json);
  }

  final String label;
  final String value;
  final String? description;
  final ComponentEmojiResponse? emoji;
  final bool? default_;

  /// Converts a [StringSelectOptionResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'value': value,
      if (description != null) 'description': description,
      if (emoji != null) 'emoji': emoji?.toJson(),
      if (default_ != null) 'default': default_,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([label, value, description, emoji, default_]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StringSelectOptionResponse &&
        label == other.label &&
        value == other.value &&
        description == other.description &&
        emoji == other.emoji &&
        default_ == other.default_;
  }
}
