// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubCheckApp', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GithubCheckApp(name: 'example');
      final parsed = GithubCheckApp.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubCheckApp.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GithubCheckApp.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
