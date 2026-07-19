// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubCheckRun', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GithubCheckRun(
        name: 'example',
        htmlUrl: Uri.parse('https://example.com'),
        checkSuite: const GithubCheckSuite(
          headSha: 'example',
          app: GithubCheckApp(name: 'example'),
        ),
      );
      final parsed = GithubCheckRun.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubCheckRun.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GithubCheckRun.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
