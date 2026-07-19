// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetStatus200ResponseLeaderboardsMostSubmittedChartsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetStatus200ResponseLeaderboardsMostSubmittedChartsInner(
        agentSymbol: 'example',
        chartCount: 0,
      );
      final parsed =
          GetStatus200ResponseLeaderboardsMostSubmittedChartsInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        GetStatus200ResponseLeaderboardsMostSubmittedChartsInner.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            GetStatus200ResponseLeaderboardsMostSubmittedChartsInner.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
