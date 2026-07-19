import 'package:github/model_helpers.dart';
import 'package:github/models/custom_property_value.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateOrUpdateCustomPropertiesValuesRequest {
  const ReposCreateOrUpdateCustomPropertiesValuesRequest({
    required this.properties,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposCreateOrUpdateCustomPropertiesValuesRequest].
  factory ReposCreateOrUpdateCustomPropertiesValuesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposCreateOrUpdateCustomPropertiesValuesRequest',
      json,
      () => ReposCreateOrUpdateCustomPropertiesValuesRequest(
        properties: (json['properties'] as List)
            .map<CustomPropertyValue>(
              (e) => CustomPropertyValue.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateOrUpdateCustomPropertiesValuesRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateOrUpdateCustomPropertiesValuesRequest.fromJson(json);
  }

  /// A list of custom property names and associated values to apply to the
  /// repositories.
  final List<CustomPropertyValue> properties;

  /// Converts a [ReposCreateOrUpdateCustomPropertiesValuesRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'properties': properties.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(properties).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateOrUpdateCustomPropertiesValuesRequest &&
        listsEqual(properties, other.properties);
  }
}
