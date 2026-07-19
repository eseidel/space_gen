// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('Survey', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Survey(
        signature: 'example',
        symbol: 'example',
        deposits: const <SurveyDeposit>[
          SurveyDeposit(symbol: TradeSymbol.preciousStones),
        ],
        expiration: DateTime.utc(2024),
        size: SurveySize.small,
      );
      final parsed = Survey.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Survey.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Survey.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
