// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AutomodKeywordPresetType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AutomodKeywordPresetType.profanity;
      final parsed = AutomodKeywordPresetType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AutomodKeywordPresetType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AutomodKeywordPresetType.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in AutomodKeywordPresetType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AutomodKeywordPresetType.values) {
        expect(
          AutomodKeywordPresetType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
