// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('SystemFaction', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SystemFaction(symbol: FactionSymbol.cosmic);
      final parsed = SystemFaction.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SystemFaction.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SystemFaction.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
