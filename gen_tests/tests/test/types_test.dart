import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('Date', () {
    test('DateType', () async {
      final date = DateType('2021-01-01');
      expect(date.toJson(), '2021-01-01');
      expect(DateType.maybeFromJson(null), isNull);

      expect(
        () => DateType.fromJson('not a date'),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => DateType.fromJson('01-01-2021'),
        throwsA(isA<FormatException>()),
      );
    });
  });
  group('Email', () {
    test('EmailType', () async {
      final email = EmailType('test@example.com');
      expect(email.toJson(), 'test@example.com');
      expect(EmailType.maybeFromJson(null), isNull);

      expect(
        () => EmailType.fromJson('not an email'),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => EmailType.fromJson('test@example'),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
