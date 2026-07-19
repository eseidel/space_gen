// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateSurvey201ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CreateSurvey201ResponseData(
        cooldown: const Cooldown(
          shipSymbol: 'example',
          totalSeconds: 0,
          remainingSeconds: 0,
        ),
        surveys: <Survey>[
          Survey(
            signature: 'example',
            symbol: 'example',
            deposits: const <SurveyDeposit>[
              SurveyDeposit(symbol: TradeSymbol.preciousStones),
            ],
            expiration: DateTime.utc(2024),
            size: SurveySize.small,
          ),
        ],
      );
      final parsed = CreateSurvey201ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateSurvey201ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateSurvey201ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
