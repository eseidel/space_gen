// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetStatus200ResponseLeaderboardsMostCreditsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetStatus200ResponseLeaderboardsMostCreditsInner(
        agentSymbol: 'example',
        credits: 0,
      );
      final parsed =
          GetStatus200ResponseLeaderboardsMostCreditsInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        GetStatus200ResponseLeaderboardsMostCreditsInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetStatus200ResponseLeaderboardsMostCreditsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
