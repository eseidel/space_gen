// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('SkuIneligibilityReason', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SkuIneligibilityReason.other;
      final parsed = SkuIneligibilityReason.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SkuIneligibilityReason.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SkuIneligibilityReason.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in SkuIneligibilityReason.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in SkuIneligibilityReason.values) {
        expect(SkuIneligibilityReason.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
