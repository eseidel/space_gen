// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('HookDeliveryRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = HookDeliveryRequest(
        headers: {'key': <String, dynamic>{}},
        payload: {'key': <String, dynamic>{}},
      );
      final parsed = HookDeliveryRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(HookDeliveryRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => HookDeliveryRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
