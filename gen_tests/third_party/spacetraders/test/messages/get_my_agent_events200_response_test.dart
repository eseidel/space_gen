// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetMyAgentEvents200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetMyAgentEvents200Response(
        data: <AgentEvent>[
          AgentEvent(
            id: 'example',
            type: 'example',
            message: 'example',
            createdAt: DateTime.utc(2024),
          ),
        ],
      );
      final parsed = GetMyAgentEvents200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetMyAgentEvents200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetMyAgentEvents200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
