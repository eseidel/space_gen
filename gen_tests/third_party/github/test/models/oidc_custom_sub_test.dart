// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OidcCustomSub', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OidcCustomSub(includeClaimKeys: <String>['example']);
      final parsed = OidcCustomSub.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OidcCustomSub.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OidcCustomSub.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
