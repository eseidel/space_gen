// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Email', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Email(
        email: 'user@example.com',
        primary: false,
        verified: false,
        visibility: 'public',
      );
      final parsed = Email.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Email.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Email.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
