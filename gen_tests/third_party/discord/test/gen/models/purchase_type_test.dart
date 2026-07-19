// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PurchaseType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PurchaseType.guildProduct;
      final parsed = PurchaseType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PurchaseType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => PurchaseType.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in PurchaseType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in PurchaseType.values) {
        expect(PurchaseType.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
