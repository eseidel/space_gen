import 'package:meta/meta.dart';
import 'package:petstore/model_helpers.dart';

@immutable
class Category {
  const Category({this.id, this.name});

  /// Converts a `Map<String, dynamic>` to a [Category].
  factory Category.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Category',
      json,
      () => Category(id: json['id'] as int?, name: json['name'] as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Category? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Category.fromJson(json);
  }

  /// Example: `1`
  final int? id;

  /// Example: `'Dogs'`
  final String? name;

  /// Converts a [Category] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (id != null) 'id': id, if (name != null) 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([id, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Category && id == other.id && name == other.name;
  }
}
