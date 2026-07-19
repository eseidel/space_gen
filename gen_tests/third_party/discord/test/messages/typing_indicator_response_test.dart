// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('TypingIndicatorResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TypingIndicatorResponse();
      final parsed = TypingIndicatorResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TypingIndicatorResponse.maybeFromJson(null), isNull);
    });
  });
}
