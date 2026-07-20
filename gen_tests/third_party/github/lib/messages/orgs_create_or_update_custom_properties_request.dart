import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/custom_property.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsCreateOrUpdateCustomPropertiesRequest {
  OrgsCreateOrUpdateCustomPropertiesRequest({required this.properties}) {
    properties.validate(minItems: 1, maxItems: 100);
  }

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsCreateOrUpdateCustomPropertiesRequest].
  factory OrgsCreateOrUpdateCustomPropertiesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgsCreateOrUpdateCustomPropertiesRequest',
      json,
      () => OrgsCreateOrUpdateCustomPropertiesRequest(
        properties: (json['properties'] as List)
            .map<CustomProperty>(
              (e) => CustomProperty.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsCreateOrUpdateCustomPropertiesRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsCreateOrUpdateCustomPropertiesRequest.fromJson(json);
  }

  /// The array of custom properties to create or update.
  final List<CustomProperty> properties;

  /// Converts an [OrgsCreateOrUpdateCustomPropertiesRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'properties': properties.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(properties).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsCreateOrUpdateCustomPropertiesRequest &&
        listsEqual(properties, other.properties);
  }
}
