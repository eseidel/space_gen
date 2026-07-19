// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestMinimalBaseRepo', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullRequestMinimalBaseRepo(
        id: 0,
        url: 'example',
        name: 'example',
      );
      final parsed = PullRequestMinimalBaseRepo.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestMinimalBaseRepo.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestMinimalBaseRepo.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
