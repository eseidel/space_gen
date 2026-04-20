import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('Date', () {
    test('DateType wraps DateTime and serializes to YYYY-MM-DD', () {
      final date = DateType(DateTime(2021, 1, 15));
      expect(date.toJson(), '2021-01-15');
      expect(DateType.maybeFromJson(null), isNull);

      // Round-trip through fromJson.
      final parsed = DateType.fromJson('2021-01-15');
      expect(parsed.value, DateTime.parse('2021-01-15'));
      expect(parsed.toJson(), '2021-01-15');
    });
  });
  group('Email', () {
    test('EmailType wraps String and is a no-op on toJson', () {
      final email = EmailType('test@example.com');
      expect(email.toJson(), 'test@example.com');
      expect(EmailType.maybeFromJson(null), isNull);

      // TODO(eseidel): Email should validate the email string.
      expect(EmailType.fromJson('not an email').value, isA<String>());
      expect(EmailType.fromJson('test@example').value, isA<String>());
    });
  });
}
