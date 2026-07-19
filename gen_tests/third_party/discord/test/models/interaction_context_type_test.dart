// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('InteractionContextType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = InteractionContextType.guild;
      final parsed = InteractionContextType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InteractionContextType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InteractionContextType.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in InteractionContextType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in InteractionContextType.values) {
        expect(InteractionContextType.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
