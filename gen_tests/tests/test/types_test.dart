import 'package:test/test.dart';
import 'package:tests/tests.dart';
import 'package:types/api.dart';

void main() {
  group('Date', () {
    test('get date', () async {
      final client = Types();
      final date = await client.defaultApi.getDate();
      expect(date, isA<DateTime>());
    });
  });
  group('Email', () {
    test('get email', () async {
      final client = Types();
      final email = await client.defaultApi.getEmail();
      expect(email, isA<String>());
    });
  });
}
