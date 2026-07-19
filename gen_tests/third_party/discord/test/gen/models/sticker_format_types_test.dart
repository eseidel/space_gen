// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('StickerFormatTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = StickerFormatTypes.png;
      final parsed = StickerFormatTypes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(StickerFormatTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => StickerFormatTypes.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in StickerFormatTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in StickerFormatTypes.values) {
        expect(StickerFormatTypes.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
