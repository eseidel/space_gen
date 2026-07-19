// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ThreadSearchTagSetting', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ThreadSearchTagSetting.matchAll;
      final parsed = ThreadSearchTagSetting.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ThreadSearchTagSetting.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ThreadSearchTagSetting.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ThreadSearchTagSetting.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ThreadSearchTagSetting.values) {
        expect(ThreadSearchTagSetting.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
