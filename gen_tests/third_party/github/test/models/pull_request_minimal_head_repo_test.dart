// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestMinimalHeadRepo', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullRequestMinimalHeadRepo(
        id: 0,
        url: 'example',
        name: 'example',
      );
      final parsed = PullRequestMinimalHeadRepo.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestMinimalHeadRepo.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestMinimalHeadRepo.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
