import 'package:github/model_helpers.dart';
import 'package:github/models/code_search_result_item.dart';
import 'package:meta/meta.dart';

@immutable
class SearchCode200Response {
  const SearchCode200Response({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  /// Converts a `Map<String, dynamic>` to a [SearchCode200Response].
  factory SearchCode200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SearchCode200Response',
      json,
      () => SearchCode200Response(
        totalCount: json['total_count'] as int,
        incompleteResults: json['incomplete_results'] as bool,
        items: (json['items'] as List)
            .map<CodeSearchResultItem>(
              (e) => CodeSearchResultItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SearchCode200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SearchCode200Response.fromJson(json);
  }

  final int totalCount;
  final bool incompleteResults;
  final List<CodeSearchResultItem> items;

  /// Converts a [SearchCode200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'incomplete_results': incompleteResults,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([totalCount, incompleteResults, listHash(items)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchCode200Response &&
        totalCount == other.totalCount &&
        incompleteResults == other.incompleteResults &&
        listsEqual(items, other.items);
  }
}
