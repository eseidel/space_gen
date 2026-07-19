// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApiOverviewDomains', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApiOverviewDomains();
      final parsed = ApiOverviewDomains.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApiOverviewDomains.maybeFromJson(null), isNull);
    });
  });
}
