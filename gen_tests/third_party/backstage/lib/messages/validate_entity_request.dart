import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ValidateEntityRequest {
  const ValidateEntityRequest({required this.location, required this.entity});

  /// Converts a `Map<String, dynamic>` to a [ValidateEntityRequest].
  factory ValidateEntityRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ValidateEntityRequest',
      json,
      () => ValidateEntityRequest(
        location: json['location'] as String,
        entity: json['entity'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ValidateEntityRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ValidateEntityRequest.fromJson(json);
  }

  final String location;
  final Map<String, dynamic> entity;

  /// Converts a [ValidateEntityRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'location': location, 'entity': entity};
  }

  @override
  int get hashCode => Object.hashAll([location, mapHash(entity)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValidateEntityRequest &&
        location == other.location &&
        mapsEqual(entity, other.entity);
  }
}
