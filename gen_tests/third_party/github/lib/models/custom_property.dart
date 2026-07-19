import 'package:github/model_helpers.dart';
import 'package:github/models/custom_property_default_value.dart';
import 'package:github/models/custom_property_source_type.dart';
import 'package:github/models/custom_property_value_type.dart';
import 'package:github/models/custom_property_values_editable_by.dart';
import 'package:meta/meta.dart';

/// {@template custom_property}
/// Organization Custom Property
/// Custom property defined on an organization
/// {@endtemplate}
@immutable
class CustomProperty {
  /// {@macro custom_property}
  const CustomProperty({
    required this.propertyName,
    required this.valueType,
    this.url,
    this.sourceType,
    this.required_,
    this.defaultValue,
    this.description,
    this.allowedValues,
    this.valuesEditableBy,
  });

  /// Converts a `Map<String, dynamic>` to a [CustomProperty].
  factory CustomProperty.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CustomProperty',
      json,
      () => CustomProperty(
        propertyName: json['property_name'] as String,
        url: maybeParseUri(json['url'] as String?),
        sourceType: CustomPropertySourceType.maybeFromJson(
          json['source_type'] as String?,
        ),
        valueType: CustomPropertyValueType.fromJson(
          json['value_type'] as String,
        ),
        required_: json['required'] as bool?,
        defaultValue: CustomPropertyDefaultValue.maybeFromJson(
          json['default_value'] as Map<String, dynamic>?,
        ),
        description: json['description'] as String?,
        allowedValues: (json['allowed_values'] as List?)?.cast<String>(),
        valuesEditableBy: CustomPropertyValuesEditableBy.maybeFromJson(
          json['values_editable_by'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CustomProperty? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CustomProperty.fromJson(json);
  }

  /// The name of the property
  final String propertyName;

  /// The URL that can be used to fetch, update, or delete info about this
  /// property via the API.
  final Uri? url;

  /// The source type of the property
  /// Example: `'organization'`
  final CustomPropertySourceType? sourceType;

  /// The type of the value for the property
  /// Example: `'single_select'`
  final CustomPropertyValueType valueType;

  /// Whether the property is required.
  final bool? required_;

  /// Default value of the property
  final CustomPropertyDefaultValue? defaultValue;

  /// Short description of the property
  final String? description;

  /// An ordered list of the allowed values of the property.
  /// The property can have up to 200 allowed values.
  final List<String>? allowedValues;

  /// Who can edit the values of the property
  /// Example: `'org_actors'`
  final CustomPropertyValuesEditableBy? valuesEditableBy;

  /// Converts a [CustomProperty] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'property_name': propertyName,
      'url': ?url?.toString(),
      'source_type': ?sourceType?.toJson(),
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
    propertyName,
    url,
    sourceType,
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
    return other is CustomProperty &&
        propertyName == other.propertyName &&
        url == other.url &&
        sourceType == other.sourceType &&
        valueType == other.valueType &&
        required_ == other.required_ &&
        defaultValue == other.defaultValue &&
        description == other.description &&
        listsEqual(allowedValues, other.allowedValues) &&
        valuesEditableBy == other.valuesEditableBy;
  }
}
