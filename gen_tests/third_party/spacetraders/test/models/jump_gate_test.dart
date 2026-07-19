// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('JumpGate', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = JumpGate(
        symbol: WaypointSymbol('example'),
        connections: const <String>['example'],
      );
      final parsed = JumpGate.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(JumpGate.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => JumpGate.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
