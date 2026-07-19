// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Hovercard', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Hovercard(
        contexts: <HovercardContextsInner>[
          HovercardContextsInner(message: 'example', octicon: 'example'),
        ],
      );
      final parsed = Hovercard.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Hovercard.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Hovercard.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
