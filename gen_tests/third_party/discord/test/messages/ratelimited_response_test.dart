// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RatelimitedResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RatelimitedResponse(
        code: 0,
        message: 'example',
        retryAfter: 0,
        global: false,
      );
      final parsed = RatelimitedResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RatelimitedResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RatelimitedResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
