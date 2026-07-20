import 'package:discord/api_exception.dart';
import 'package:discord/messages/component_emoji_for_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class StringSelectOptionForRequest {
  StringSelectOptionForRequest({
    required this.label,
    required this.value,
    this.description,
    this.default_,
    this.emoji,
  }) {
    label.validate(minLength: 1, maxLength: 100);
    value.validate(minLength: 1, maxLength: 100);
    description?.validate(maxLength: 100);
  }

  /// Converts a `Map<String, dynamic>` to a [StringSelectOptionForRequest].
  factory StringSelectOptionForRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StringSelectOptionForRequest',
      json,
      () => StringSelectOptionForRequest(
        label: json['label'] as String,
        value: json['value'] as String,
        description: json['description'] as String?,
        default_: json['default'] as bool?,
        emoji: ComponentEmojiForRequest.maybeFromJson(
          json['emoji'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StringSelectOptionForRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return StringSelectOptionForRequest.fromJson(json);
  }

  final String label;
  final String value;
  final String? description;
  final bool? default_;
  final ComponentEmojiForRequest? emoji;

  /// Converts a [StringSelectOptionForRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'value': value,
      'description': description,
      'default': default_,
      'emoji': emoji?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([label, value, description, default_, emoji]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StringSelectOptionForRequest &&
        label == other.label &&
        value == other.value &&
        description == other.description &&
        default_ == other.default_ &&
        emoji == other.emoji;
  }
}
