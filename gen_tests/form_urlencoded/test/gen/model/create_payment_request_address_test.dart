// GENERATED — do not hand-edit.
import 'package:form_urlencoded/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreatePaymentRequestAddress', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CreatePaymentRequestAddress();
      final parsed = CreatePaymentRequestAddress.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreatePaymentRequestAddress.maybeFromJson(null), isNull);
    });
  });
}
