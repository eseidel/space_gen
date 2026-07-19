// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GatewayBotSessionStartLimitResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GatewayBotSessionStartLimitResponse(
        maxConcurrency: 0,
        remaining: 0,
        resetAfter: 0,
        total: 0,
      );
      final parsed = GatewayBotSessionStartLimitResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GatewayBotSessionStartLimitResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GatewayBotSessionStartLimitResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
