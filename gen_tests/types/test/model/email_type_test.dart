// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('EmailType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EmailType('example');
      final parsed = EmailType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EmailType.maybeFromJson(null), isNull);
    });
  });
}
