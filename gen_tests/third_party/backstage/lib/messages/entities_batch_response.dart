import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/nullable_entity_any_of_0.dart';
import 'package:meta/meta.dart';

@immutable
class EntitiesBatchResponse {
  const EntitiesBatchResponse({required this.items});

  /// Converts a `Map<String, dynamic>` to an [EntitiesBatchResponse].
  factory EntitiesBatchResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntitiesBatchResponse',
      json,
      () => EntitiesBatchResponse(
        items: (json['items'] as List)
            .map<NullableEntityAnyOf0>(
              (e) => NullableEntityAnyOf0.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntitiesBatchResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntitiesBatchResponse.fromJson(json);
  }

  /// The list of entities, in the same order as the refs in the request.
  /// Entries
  /// that are null signify that no entity existed with that ref.
  final List<NullableEntityAnyOf0> items;

  /// Converts an [EntitiesBatchResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'items': items.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(items).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntitiesBatchResponse && listsEqual(items, other.items);
  }
}
