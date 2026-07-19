// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetAgents200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetAgents200Response(
        data: <PublicAgent>[
          PublicAgent(
            symbol: 'example',
            headquarters: 'example',
            credits: 0,
            startingFaction: 'example',
            shipCount: 0,
          ),
        ],
        meta: Meta(total: 0, limit: 1),
      );
      final parsed = GetAgents200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetAgents200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetAgents200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
