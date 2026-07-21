// GENERATED — do not hand-edit.
import 'package:form_urlencoded/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreatePaymentRequestLineItemsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CreatePaymentRequestLineItemsInner();
      final parsed = CreatePaymentRequestLineItemsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreatePaymentRequestLineItemsInner.maybeFromJson(null), isNull);
    });
  });
}
