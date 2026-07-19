// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PagesHealthCheckDomain', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PagesHealthCheckDomain();
      final parsed = PagesHealthCheckDomain.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PagesHealthCheckDomain.maybeFromJson(null), isNull);
    });
  });
}
