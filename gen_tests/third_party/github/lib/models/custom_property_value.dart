import 'package:github/model_helpers.dart';
import 'package:github/models/custom_property_value_value.dart';
import 'package:meta/meta.dart';

/// {@template custom_property_value}
/// Custom Property Value
/// Custom property name and associated value
/// {@endtemplate}
@immutable
class CustomPropertyValue {
  /// {@macro custom_property_value}
  const CustomPropertyValue({required this.propertyName, required this.value});

  /// Converts a `Map<String, dynamic>` to a [CustomPropertyValue].
  factory CustomPropertyValue.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CustomPropertyValue',
      json,
      () => CustomPropertyValue(
        propertyName: json['property_name'] as String,
        value: CustomPropertyValueValue.maybeFromJson(
          checkedKey(json, 'value') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CustomPropertyValue? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CustomPropertyValue.fromJson(json);
  }

  /// The name of the property
  final String propertyName;

  /// The value assigned to the property
  final CustomPropertyValueValue? value;

  /// Converts a [CustomPropertyValue] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'property_name': propertyName, 'value': value?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([propertyName, value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomPropertyValue &&
        propertyName == other.propertyName &&
        value == other.value;
  }
}
