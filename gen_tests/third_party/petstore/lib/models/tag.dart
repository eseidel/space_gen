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
    return {if (id != null) 'id': id, if (name != null) 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([id, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Tag && id == other.id && name == other.name;
  }
}
