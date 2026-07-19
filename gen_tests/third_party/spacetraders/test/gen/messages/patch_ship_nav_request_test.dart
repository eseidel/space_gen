// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('PatchShipNavRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PatchShipNavRequest();
      final parsed = PatchShipNavRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PatchShipNavRequest.maybeFromJson(null), isNull);
    });
  });
}
