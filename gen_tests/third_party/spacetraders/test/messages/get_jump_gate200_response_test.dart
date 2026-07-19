// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetJumpGate200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetJumpGate200Response(
        data: JumpGate(
          symbol: WaypointSymbol('example'),
          connections: const <String>['example'],
        ),
      );
      final parsed = GetJumpGate200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetJumpGate200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetJumpGate200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
