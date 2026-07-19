// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OidcCustomSubRepo', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OidcCustomSubRepo(useDefault: false);
      final parsed = OidcCustomSubRepo.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OidcCustomSubRepo.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OidcCustomSubRepo.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
