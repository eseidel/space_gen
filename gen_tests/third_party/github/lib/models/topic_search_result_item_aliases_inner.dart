import 'package:github/model_helpers.dart';
import 'package:github/models/topic_search_result_item_aliases_inner_topic_relation.dart';
import 'package:meta/meta.dart';

@immutable
class TopicSearchResultItemAliasesInner {
  const TopicSearchResultItemAliasesInner({this.topicRelation});

  /// Converts a `Map<String, dynamic>` to a
  /// [TopicSearchResultItemAliasesInner].
  factory TopicSearchResultItemAliasesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TopicSearchResultItemAliasesInner',
      json,
      () => TopicSearchResultItemAliasesInner(
        topicRelation:
            TopicSearchResultItemAliasesInnerTopicRelation.maybeFromJson(
              json['topic_relation'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TopicSearchResultItemAliasesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TopicSearchResultItemAliasesInner.fromJson(json);
  }

  final TopicSearchResultItemAliasesInnerTopicRelation? topicRelation;

  /// Converts a [TopicSearchResultItemAliasesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'topic_relation': ?topicRelation?.toJson()};
  }

  @override
  int get hashCode => topicRelation.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TopicSearchResultItemAliasesInner &&
        topicRelation == other.topicRelation;
  }
}
