// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class EntityMetadataExternal {
  EntityMetadataExternal({required this.location}) {
    location.validate(maxLength: 100);
  }

  /// Converts a `Map<String, dynamic>` to an [EntityMetadataExternal].
  factory EntityMetadataExternal.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntityMetadataExternal',
      json,
      () => EntityMetadataExternal(location: json['location'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityMetadataExternal? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntityMetadataExternal.fromJson(json);
  }

  final String location;

  /// Converts an [EntityMetadataExternal] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'location': location};
  }

  @override
  int get hashCode => location.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntityMetadataExternal && location == other.location;
  }
}
