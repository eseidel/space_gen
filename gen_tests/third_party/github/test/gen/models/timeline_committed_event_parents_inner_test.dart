// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TimelineCommittedEventParentsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TimelineCommittedEventParentsInner(
        sha: '7638417db6d59f3c431d3e1f261cc637155684cd',
        url: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
      );
      final parsed = TimelineCommittedEventParentsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TimelineCommittedEventParentsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TimelineCommittedEventParentsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
