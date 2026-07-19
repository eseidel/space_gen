// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TopicSearchResultItemRelatedInnerTopicRelation', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TopicSearchResultItemRelatedInnerTopicRelation();
      final parsed =
          TopicSearchResultItemRelatedInnerTopicRelation.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        TopicSearchResultItemRelatedInnerTopicRelation.maybeFromJson(null),
        isNull,
      );
    });
  });
}
