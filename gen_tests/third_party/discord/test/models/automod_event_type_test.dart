// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AutomodEventType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AutomodEventType.messageSend;
      final parsed = AutomodEventType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AutomodEventType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => AutomodEventType.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in AutomodEventType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AutomodEventType.values) {
        expect(AutomodEventType.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
