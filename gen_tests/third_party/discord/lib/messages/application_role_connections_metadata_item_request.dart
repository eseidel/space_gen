import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/metadata_item_types.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationRoleConnectionsMetadataItemRequest {
  ApplicationRoleConnectionsMetadataItemRequest({
    required this.type,
    required this.key,
    required this.name,
    required this.description,
    this.nameLocalizations,
    this.descriptionLocalizations,
  }) {
    key.validate(minLength: 1, maxLength: 50);
    name.validate(minLength: 1, maxLength: 100);
    nameLocalizations?.validate(maxProperties: 1521);
    description.validate(minLength: 1, maxLength: 200);
    descriptionLocalizations?.validate(maxProperties: 1521);
  }

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationRoleConnectionsMetadataItemRequest].
  factory ApplicationRoleConnectionsMetadataItemRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationRoleConnectionsMetadataItemRequest',
      json,
      () => ApplicationRoleConnectionsMetadataItemRequest(
        type: MetadataItemTypes.fromJson(json['type'] as int),
        key: json['key'] as String,
        name: json['name'] as String,
        nameLocalizations: (json['name_localizations'] as Map<String, dynamic>?)
            ?.map((key, value) => MapEntry(key, value as String)),
        description: json['description'] as String,
        descriptionLocalizations:
            (json['description_localizations'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(key, value as String),
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationRoleConnectionsMetadataItemRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationRoleConnectionsMetadataItemRequest.fromJson(json);
  }

  final MetadataItemTypes type;
  final String key;
  final String name;
  final Map<String, String>? nameLocalizations;
  final String description;
  final Map<String, String>? descriptionLocalizations;

  /// Converts an [ApplicationRoleConnectionsMetadataItemRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'key': key,
      'name': name,
      'name_localizations': nameLocalizations,
      'description': description,
      'description_localizations': descriptionLocalizations,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    key,
    name,
    mapHash(nameLocalizations),
    description,
    mapHash(descriptionLocalizations),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationRoleConnectionsMetadataItemRequest &&
        type == other.type &&
        key == other.key &&
        name == other.name &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        description == other.description &&
        mapsEqual(descriptionLocalizations, other.descriptionLocalizations);
  }
}
