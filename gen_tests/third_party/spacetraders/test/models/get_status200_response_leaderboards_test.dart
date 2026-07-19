// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetStatus200ResponseLeaderboards', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetStatus200ResponseLeaderboards(
        mostCredits: <GetStatus200ResponseLeaderboardsMostCreditsInner>[
          GetStatus200ResponseLeaderboardsMostCreditsInner(
            agentSymbol: 'example',
            credits: 0,
          ),
        ],
        mostSubmittedCharts:
            <GetStatus200ResponseLeaderboardsMostSubmittedChartsInner>[
              GetStatus200ResponseLeaderboardsMostSubmittedChartsInner(
                agentSymbol: 'example',
                chartCount: 0,
              ),
            ],
      );
      final parsed = GetStatus200ResponseLeaderboards.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetStatus200ResponseLeaderboards.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            GetStatus200ResponseLeaderboards.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
