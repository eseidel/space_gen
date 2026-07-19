// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('HovercardContextsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = HovercardContextsInner(
        message: 'example',
        octicon: 'example',
      );
      final parsed = HovercardContextsInner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(HovercardContextsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => HovercardContextsInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
