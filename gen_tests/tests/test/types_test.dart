import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('Date', () {
    test('DateType', () async {
      final date = DateType('2021-01-01');
      expect(date.toJson(), '2021-01-01');
      expect(DateType.maybeFromJson(null), isNull);

      // TODO(eseidel): Date should validate the date string.
      expect(DateType.fromJson('not a date'), isA<String>());
      expect(DateType.fromJson('01-01-2021'), isA<String>());
    });
  });
  group('Email', () {
    test('EmailType', () async {
      final email = EmailType('test@example.com');
      expect(email.toJson(), 'test@example.com');
      expect(EmailType.maybeFromJson(null), isNull);

      // TODO(eseidel): Email should validate the email string.
      expect(EmailType.fromJson('not an email'), isA<String>());
      expect(EmailType.fromJson('test@example'), isA<String>());
    });
  });
}
