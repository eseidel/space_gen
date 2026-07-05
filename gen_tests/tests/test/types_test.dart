import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('Date', () {
    test('Date is a calendar day serializing to YYYY-MM-DD', () {
      final date = Date(2021, 1, 15);
      expect(date.toJson(), '2021-01-15');
      expect(Date.maybeFromJson(null), isNull);

      // Round-trip through fromJson — structural equality, no timezone.
      final parsed = Date.fromJson('2021-01-15');
      expect(parsed, Date(2021, 1, 15));
      expect(parsed.toJson(), '2021-01-15');
      expect((parsed.year, parsed.month, parsed.day), (2021, 1, 15));
    });

    test('Date normalizes any DateTime to its calendar day', () {
      // A DateTime with a time component keeps only the date; converting back
      // to a DateTime forces an explicit timezone (no silent instant).
      final noon = DateTime.utc(2021, 1, 15, 12, 30);
      final date = Date(noon.year, noon.month, noon.day);
      expect(date.toJson(), '2021-01-15');
      expect(date.toUtcDateTime(), DateTime.utc(2021, 1, 15));
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
