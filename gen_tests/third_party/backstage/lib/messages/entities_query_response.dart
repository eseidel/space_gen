import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/entities_query_response_page_info.dart';
import 'package:backstage/models/entity.dart';
import 'package:meta/meta.dart';

@immutable
class EntitiesQueryResponse {
  const EntitiesQueryResponse({
    required this.items,
    required this.totalItems,
    required this.pageInfo,
  });

  /// Converts a `Map<String, dynamic>` to an [EntitiesQueryResponse].
  factory EntitiesQueryResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntitiesQueryResponse',
      json,
      () => EntitiesQueryResponse(
        items: (json['items'] as List)
            .map<Entity>((e) => Entity.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalItems: (json['totalItems'] as num).toDouble(),
        pageInfo: EntitiesQueryResponsePageInfo.fromJson(
          json['pageInfo'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntitiesQueryResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntitiesQueryResponse.fromJson(json);
  }

  /// The list of entities paginated by a specific filter.
  final List<Entity> items;
  final double totalItems;
  final EntitiesQueryResponsePageInfo pageInfo;

  /// Converts an [EntitiesQueryResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'totalItems': totalItems,
      'pageInfo': pageInfo.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(items), totalItems, pageInfo]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntitiesQueryResponse &&
        listsEqual(items, other.items) &&
        totalItems == other.totalItems &&
        pageInfo == other.pageInfo;
  }
}
