// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetStatus200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetStatus200Response(
        status: 'example',
        version: 'example',
        resetDate: 'example',
        description: 'example',
        stats: const GetStatus200ResponseStats(
          agents: 0,
          ships: 0,
          systems: 0,
          waypoints: 0,
        ),
        health: const GetStatus200ResponseHealth(),
        leaderboards: const GetStatus200ResponseLeaderboards(
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
        ),
        serverResets: const GetStatus200ResponseServerResets(
          next: 'example',
          frequency: 'example',
        ),
        announcements: const <GetStatus200ResponseAnnouncementsInner>[
          GetStatus200ResponseAnnouncementsInner(
            title: 'example',
            body: 'example',
          ),
        ],
        links: <GetStatus200ResponseLinksInner>[
          GetStatus200ResponseLinksInner(
            name: 'example',
            url: Uri.parse('https://example.com'),
          ),
        ],
      );
      final parsed = GetStatus200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetStatus200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetStatus200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
