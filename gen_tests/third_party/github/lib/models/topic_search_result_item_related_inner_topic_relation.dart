import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TopicSearchResultItemRelatedInnerTopicRelation {
  const TopicSearchResultItemRelatedInnerTopicRelation({
    this.id,
    this.name,
    this.topicId,
    this.relationType,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [TopicSearchResultItemRelatedInnerTopicRelation].
  factory TopicSearchResultItemRelatedInnerTopicRelation.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TopicSearchResultItemRelatedInnerTopicRelation',
      json,
      () => TopicSearchResultItemRelatedInnerTopicRelation(
        id: json['id'] as int?,
        name: json['name'] as String?,
        topicId: json['topic_id'] as int?,
        relationType: json['relation_type'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TopicSearchResultItemRelatedInnerTopicRelation? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TopicSearchResultItemRelatedInnerTopicRelation.fromJson(json);
  }

  final int? id;
  final String? name;
  final int? topicId;
  final String? relationType;

  /// Converts a [TopicSearchResultItemRelatedInnerTopicRelation]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': ?id,
      'name': ?name,
      'topic_id': ?topicId,
      'relation_type': ?relationType,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, name, topicId, relationType]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TopicSearchResultItemRelatedInnerTopicRelation &&
        id == other.id &&
        name == other.name &&
        topicId == other.topicId &&
        relationType == other.relationType;
  }
}
