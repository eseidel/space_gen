// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';
import 'package:petstore/model_helpers.dart';

@immutable
class Tag {
  const Tag({this.id, this.name});

  /// Converts a `Map<String, dynamic>` to a [Tag].
  factory Tag.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Tag',
      json,
      () => Tag(id: json['id'] as int?, name: json['name'] as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Tag? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Tag.fromJson(json);
  }

  final int? id;
  final String? name;

  /// Converts a [Tag] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': ?id, 'name': ?name};
  }

  @override
  int get hashCode => Object.hashAll([id, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Tag && id == other.id && name == other.name;
  }
}
