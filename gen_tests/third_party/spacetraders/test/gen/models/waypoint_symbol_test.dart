// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('WaypointSymbol', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = WaypointSymbol('example');
      final parsed = WaypointSymbol.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WaypointSymbol.maybeFromJson(null), isNull);
    });
  });
}
