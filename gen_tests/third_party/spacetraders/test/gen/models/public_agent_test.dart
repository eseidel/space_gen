// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('PublicAgent', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PublicAgent(
        symbol: 'example',
        headquarters: 'example',
        credits: 0,
        startingFaction: 'example',
        shipCount: 0,
      );
      final parsed = PublicAgent.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PublicAgent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PublicAgent.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
