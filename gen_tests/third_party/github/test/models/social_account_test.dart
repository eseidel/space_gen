// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SocialAccount', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SocialAccount(
        provider: 'linkedin',
        url: 'https://www.linkedin.com/company/github/',
      );
      final parsed = SocialAccount.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SocialAccount.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SocialAccount.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
