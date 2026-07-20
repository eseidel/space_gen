// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetAgent200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetAgent200Response(
        data: PublicAgent(
          symbol: 'example',
          headquarters: 'example',
          credits: 0,
          startingFaction: 'example',
          shipCount: 0,
        ),
      );
      final parsed = GetAgent200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetAgent200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetAgent200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
