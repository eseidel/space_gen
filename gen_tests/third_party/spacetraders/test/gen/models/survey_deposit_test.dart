// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('SurveyDeposit', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SurveyDeposit(symbol: TradeSymbol.preciousStones);
      final parsed = SurveyDeposit.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SurveyDeposit.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SurveyDeposit.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
