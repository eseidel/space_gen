import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:discord/models/text_input_style_types.dart';
import 'package:meta/meta.dart';

@immutable
class TextInputComponentForModalRequest {
  TextInputComponentForModalRequest({
    required this.customId,
    required this.style,
    this.id,
    this.label,
    this.value,
    this.placeholder,
    this.required_,
    this.minLength,
    this.maxLength,
  }) {
    id?.validate(min: 0);
    customId.validate(minLength: 1, maxLength: 100);
    label?.validate(minLength: 1, maxLength: 45);
    value?.validate(maxLength: 4000);
    placeholder?.validate(maxLength: 100);
    minLength?.validate(min: 0, max: 4000);
    maxLength?.validate(min: 1, max: 4000);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [TextInputComponentForModalRequest].
  factory TextInputComponentForModalRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TextInputComponentForModalRequest',
      json,
      () => TextInputComponentForModalRequest(
        id: json['id'] as int?,
        customId: json['custom_id'] as String,
        style: TextInputStyleTypes.fromJson(json['style'] as int),
        label: json['label'] as String?,
        value: json['value'] as String?,
        placeholder: json['placeholder'] as String?,
        required_: json['required'] as bool?,
        minLength: json['min_length'] as int?,
        maxLength: json['max_length'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TextInputComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TextInputComponentForModalRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.textInput;
  final int? id;
  final String customId;
  final TextInputStyleTypes style;
  final String? label;
  final String? value;
  final String? placeholder;
  final bool? required_;
  final int? minLength;
  final int? maxLength;

  /// Converts a [TextInputComponentForModalRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'style': style.toJson(),
      'label': label,
      'value': value,
      'placeholder': placeholder,
      'required': required_,
      'min_length': minLength,
      'max_length': maxLength,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    style,
    label,
    value,
    placeholder,
    required_,
    minLength,
    maxLength,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TextInputComponentForModalRequest &&
        id == other.id &&
        customId == other.customId &&
        style == other.style &&
        label == other.label &&
        value == other.value &&
        placeholder == other.placeholder &&
        required_ == other.required_ &&
        minLength == other.minLength &&
        maxLength == other.maxLength;
  }
}
