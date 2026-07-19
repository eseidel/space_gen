// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Autolink', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Autolink(
        id: 3,
        keyPrefix: 'TICKET-',
        urlTemplate: 'https://example.com/TICKET?query=<num>',
        isAlphanumeric: false,
      );
      final parsed = Autolink.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Autolink.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Autolink.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
