import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RadioGroupOptionForRequest {
  RadioGroupOptionForRequest({
    required this.label,
    required this.value,
    this.description,
    this.default_,
  }) {
    label.validate(minLength: 1, maxLength: 100);
    value.validate(minLength: 1, maxLength: 100);
    description?.validate(maxLength: 100);
  }

  /// Converts a `Map<String, dynamic>` to a [RadioGroupOptionForRequest].
  factory RadioGroupOptionForRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RadioGroupOptionForRequest',
      json,
      () => RadioGroupOptionForRequest(
        label: json['label'] as String,
        value: json['value'] as String,
        description: json['description'] as String?,
        default_: json['default'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RadioGroupOptionForRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RadioGroupOptionForRequest.fromJson(json);
  }

  final String label;
  final String value;
  final String? description;
  final bool? default_;

  /// Converts a [RadioGroupOptionForRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'value': value,
      'description': description,
      'default': default_,
    };
  }

  @override
  int get hashCode => Object.hashAll([label, value, description, default_]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RadioGroupOptionForRequest &&
        label == other.label &&
        value == other.value &&
        description == other.description &&
        default_ == other.default_;
  }
}
