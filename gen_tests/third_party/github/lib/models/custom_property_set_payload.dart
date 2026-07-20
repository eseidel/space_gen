import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/custom_property_set_payload_default_value.dart';
import 'package:github/models/custom_property_set_payload_value_type.dart';
import 'package:github/models/custom_property_set_payload_values_editable_by.dart';
import 'package:meta/meta.dart';

/// {@template custom_property_set_payload}
/// Custom Property Set Payload
/// Custom property set payload
/// {@endtemplate}
@immutable
class CustomPropertySetPayload {
  /// {@macro custom_property_set_payload}
  CustomPropertySetPayload({
    required this.valueType,
    this.required_,
    this.defaultValue,
    this.description,
    this.allowedValues,
    this.valuesEditableBy,
  }) {
    allowedValues?.validate(maxItems: 200);
  }

  /// Converts a `Map<String, dynamic>` to a [CustomPropertySetPayload].
  factory CustomPropertySetPayload.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CustomPropertySetPayload',
      json,
      () => CustomPropertySetPayload(
        valueType: CustomPropertySetPayloadValueType.fromJson(
          json['value_type'] as String,
        ),
        required_: json['required'] as bool?,
        defaultValue: CustomPropertySetPayloadDefaultValue.maybeFromJson(
          json['default_value'] as Map<String, dynamic>?,
        ),
        description: json['description'] as String?,
        allowedValues: (json['allowed_values'] as List?)?.cast<String>(),
        valuesEditableBy:
            CustomPropertySetPayloadValuesEditableBy.maybeFromJson(
              json['values_editable_by'] as String?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CustomPropertySetPayload? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CustomPropertySetPayload.fromJson(json);
  }

  /// The type of the value for the property
  /// Example: `'single_select'`
  final CustomPropertySetPayloadValueType valueType;

  /// Whether the property is required.
  final bool? required_;

  /// Default value of the property
  final CustomPropertySetPayloadDefaultValue? defaultValue;

  /// Short description of the property
  final String? description;

  /// An ordered list of the allowed values of the property.
  /// The property can have up to 200 allowed values.
  final List<String>? allowedValues;

  /// Who can edit the values of the property
  /// Example: `'org_actors'`
  final CustomPropertySetPayloadValuesEditableBy? valuesEditableBy;

  /// Converts a [CustomPropertySetPayload] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'value_type': valueType.toJson(),
      'required': ?required_,
      'default_value': defaultValue?.toJson(),
      'description': description,
      'allowed_values': allowedValues,
      'values_editable_by': valuesEditableBy?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    valueType,
    required_,
    defaultValue,
    description,
    listHash(allowedValues),
    valuesEditableBy,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomPropertySetPayload &&
        valueType == other.valueType &&
        required_ == other.required_ &&
        defaultValue == other.defaultValue &&
        description == other.description &&
        listsEqual(allowedValues, other.allowedValues) &&
        valuesEditableBy == other.valuesEditableBy;
  }
}
