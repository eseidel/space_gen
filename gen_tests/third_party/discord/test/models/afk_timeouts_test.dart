// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AfkTimeouts', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AfkTimeouts.oneMinute;
      final parsed = AfkTimeouts.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AfkTimeouts.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => AfkTimeouts.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in AfkTimeouts.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AfkTimeouts.values) {
        expect(AfkTimeouts.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
