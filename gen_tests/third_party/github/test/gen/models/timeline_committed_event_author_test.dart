// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TimelineCommittedEventAuthor', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TimelineCommittedEventAuthor(
        date: DateTime.utc(2024),
        email: 'monalisa.octocat@example.com',
        name: 'Monalisa Octocat',
      );
      final parsed = TimelineCommittedEventAuthor.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TimelineCommittedEventAuthor.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TimelineCommittedEventAuthor.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
