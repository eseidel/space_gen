import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/entity_ancestry_response_items_inner.dart';
import 'package:meta/meta.dart';

@immutable
class EntityAncestryResponse {
  const EntityAncestryResponse({
    required this.items,
    required this.rootEntityRef,
  });

  /// Converts a `Map<String, dynamic>` to an [EntityAncestryResponse].
  factory EntityAncestryResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntityAncestryResponse',
      json,
      () => EntityAncestryResponse(
        items: (json['items'] as List)
            .map<EntityAncestryResponseItemsInner>(
              (e) => EntityAncestryResponseItemsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        rootEntityRef: json['rootEntityRef'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityAncestryResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntityAncestryResponse.fromJson(json);
  }

  final List<EntityAncestryResponseItemsInner> items;
  final String rootEntityRef;

  /// Converts an [EntityAncestryResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'rootEntityRef': rootEntityRef,
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(items), rootEntityRef]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntityAncestryResponse &&
        listsEqual(items, other.items) &&
        rootEntityRef == other.rootEntityRef;
  }
}
