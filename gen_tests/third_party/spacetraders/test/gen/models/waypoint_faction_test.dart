// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('WaypointFaction', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WaypointFaction(symbol: FactionSymbol.cosmic);
      final parsed = WaypointFaction.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WaypointFaction.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WaypointFaction.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
