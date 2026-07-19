// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('MarketTradeGoodType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MarketTradeGoodType.export_;
      final parsed = MarketTradeGoodType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MarketTradeGoodType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MarketTradeGoodType.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in MarketTradeGoodType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in MarketTradeGoodType.values) {
        expect(MarketTradeGoodType.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
