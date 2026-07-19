import 'package:meta/meta.dart';
import 'package:petstore/model_helpers.dart';
import 'package:petstore/models/category.dart';
import 'package:petstore/models/pet_status.dart';
import 'package:petstore/models/tag.dart';

@immutable
class Pet {
  const Pet({
    required this.name,
    required this.photoUrls,
    this.id,
    this.category,
    this.tags,
    this.status,
  });

  /// Converts a `Map<String, dynamic>` to a [Pet].
  factory Pet.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Pet',
      json,
      () => Pet(
        id: json['id'] as int?,
        name: json['name'] as String,
        category: Category.maybeFromJson(
          json['category'] as Map<String, dynamic>?,
        ),
        photoUrls: (json['photoUrls'] as List).cast<String>(),
        tags: (json['tags'] as List?)
            ?.map<Tag>((e) => Tag.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: PetStatus.maybeFromJson(json['status'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Pet? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Pet.fromJson(json);
  }

  /// Example: `10`
  final int? id;

  /// Example: `'doggie'`
  final String name;
  final Category? category;
  final List<String> photoUrls;
  final List<Tag>? tags;

  /// pet status in the store
  final PetStatus? status;

  /// Converts a [Pet] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category?.toJson(),
      'photoUrls': photoUrls,
      'tags': tags?.map((e) => e.toJson()).toList(),
      'status': status?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    category,
    listHash(photoUrls),
    listHash(tags),
    status,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Pet &&
        id == other.id &&
        name == other.name &&
        category == other.category &&
        listsEqual(photoUrls, other.photoUrls) &&
        listsEqual(tags, other.tags) &&
        status == other.status;
  }
}
