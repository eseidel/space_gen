// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubCheckSuite', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GithubCheckSuite(
        headSha: 'example',
        app: GithubCheckApp(name: 'example'),
      );
      final parsed = GithubCheckSuite.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubCheckSuite.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GithubCheckSuite.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
