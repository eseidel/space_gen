// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('Agent', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Agent(
        accountId: 'example',
        symbol: 'example',
        headquarters: 'example',
        credits: 0,
        startingFaction: 'example',
        shipCount: 0,
      );
      final parsed = Agent.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Agent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Agent.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
