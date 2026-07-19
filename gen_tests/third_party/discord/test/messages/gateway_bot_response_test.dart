// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GatewayBotResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GatewayBotResponse(
        url: Uri.parse('https://example.com'),
        sessionStartLimit: const GatewayBotSessionStartLimitResponse(
          maxConcurrency: 0,
          remaining: 0,
          resetAfter: 0,
          total: 0,
        ),
        shards: 0,
      );
      final parsed = GatewayBotResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GatewayBotResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GatewayBotResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
