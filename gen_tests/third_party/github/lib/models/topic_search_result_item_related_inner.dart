import 'package:github/model_helpers.dart';
import 'package:github/models/topic_search_result_item_related_inner_topic_relation.dart';
import 'package:meta/meta.dart';

@immutable
class TopicSearchResultItemRelatedInner {
  const TopicSearchResultItemRelatedInner({this.topicRelation});

  /// Converts a `Map<String, dynamic>` to a
  /// [TopicSearchResultItemRelatedInner].
  factory TopicSearchResultItemRelatedInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TopicSearchResultItemRelatedInner',
      json,
      () => TopicSearchResultItemRelatedInner(
        topicRelation:
            TopicSearchResultItemRelatedInnerTopicRelation.maybeFromJson(
              json['topic_relation'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TopicSearchResultItemRelatedInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TopicSearchResultItemRelatedInner.fromJson(json);
  }

  final TopicSearchResultItemRelatedInnerTopicRelation? topicRelation;

  /// Converts a [TopicSearchResultItemRelatedInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (topicRelation != null) 'topic_relation': topicRelation?.toJson(),
    };
  }

  @override
  int get hashCode => topicRelation.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TopicSearchResultItemRelatedInner &&
        topicRelation == other.topicRelation;
  }
}
