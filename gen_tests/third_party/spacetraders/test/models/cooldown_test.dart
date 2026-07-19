// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('Cooldown', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Cooldown(
        shipSymbol: 'example',
        totalSeconds: 0,
        remainingSeconds: 0,
      );
      final parsed = Cooldown.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Cooldown.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Cooldown.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
