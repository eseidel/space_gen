// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TimelineCommitCommentedEvent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TimelineCommitCommentedEvent();
      final parsed = TimelineCommitCommentedEvent.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TimelineCommitCommentedEvent.maybeFromJson(null), isNull);
    });
  });
}
