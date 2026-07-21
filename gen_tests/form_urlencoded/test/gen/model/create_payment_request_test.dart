// GENERATED — do not hand-edit.
import 'package:form_urlencoded/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreatePaymentRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CreatePaymentRequest(idempotencyKey: 'example');
      final parsed = CreatePaymentRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreatePaymentRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreatePaymentRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
