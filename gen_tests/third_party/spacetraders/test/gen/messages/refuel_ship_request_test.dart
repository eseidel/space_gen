// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('RefuelShipRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RefuelShipRequest();
      final parsed = RefuelShipRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RefuelShipRequest.maybeFromJson(null), isNull);
    });
  });
}
