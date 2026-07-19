// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AutomodActionType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AutomodActionType.blockMessage;
      final parsed = AutomodActionType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AutomodActionType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => AutomodActionType.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in AutomodActionType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AutomodActionType.values) {
        expect(AutomodActionType.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
