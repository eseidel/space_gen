// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AutomodTriggerType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AutomodTriggerType.keyword;
      final parsed = AutomodTriggerType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AutomodTriggerType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => AutomodTriggerType.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in AutomodTriggerType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AutomodTriggerType.values) {
        expect(AutomodTriggerType.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
