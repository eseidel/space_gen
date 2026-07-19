// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShipConditionEvent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ShipConditionEvent(
        symbol: ShipConditionEventSymbol.reactorOverload,
        component: ShipConditionEventComponent.frame,
        name: 'example',
        description: 'example',
      );
      final parsed = ShipConditionEvent.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShipConditionEvent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShipConditionEvent.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
