import 'package:github/model_helpers.dart';
import 'package:github/models/search_result_text_matches_inner.dart';
import 'package:meta/meta.dart';

/// {@template label_search_result_item}
/// Label Search Result Item
/// Label Search Result Item
/// {@endtemplate}
@immutable
class LabelSearchResultItem {
  /// {@macro label_search_result_item}
  const LabelSearchResultItem({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.name,
    required this.color,
    required this.default_,
    required this.description,
    required this.score,
    this.textMatches,
  });

  /// Converts a `Map<String, dynamic>` to a [LabelSearchResultItem].
  factory LabelSearchResultItem.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LabelSearchResultItem',
      json,
      () => LabelSearchResultItem(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        url: Uri.parse(json['url'] as String),
        name: json['name'] as String,
        color: json['color'] as String,
        default_: json['default'] as bool,
        description: checkedKey(json, 'description') as String?,
        score: (json['score'] as num).toDouble(),
        textMatches: (json['text_matches'] as List?)
            ?.map<SearchResultTextMatchesInner>(
              (e) => SearchResultTextMatchesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LabelSearchResultItem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LabelSearchResultItem.fromJson(json);
  }

  final int id;
  final String nodeId;
  final Uri url;
  final String name;
  final String color;
  final bool default_;
  final String? description;
  final double score;

  /// Search Result Text Matches
  final List<SearchResultTextMatchesInner>? textMatches;

  /// Converts a [LabelSearchResultItem] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'url': url.toString(),
      'name': name,
      'color': color,
      'default': default_,
      'description': description,
      'score': score,
      if (textMatches != null)
        'text_matches': textMatches?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    url,
    name,
    color,
    default_,
    description,
    score,
    listHash(textMatches),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LabelSearchResultItem &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        name == other.name &&
        color == other.color &&
        default_ == other.default_ &&
        description == other.description &&
        score == other.score &&
        listsEqual(textMatches, other.textMatches);
  }
}
