// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TopicSearchResultItemRelatedInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TopicSearchResultItemRelatedInner();
      final parsed = TopicSearchResultItemRelatedInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TopicSearchResultItemRelatedInner.maybeFromJson(null), isNull);
    });
  });
}
