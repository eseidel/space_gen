// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IntegrationPermissions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IntegrationPermissions(entries: <String, String>{});
      final parsed = IntegrationPermissions.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IntegrationPermissions.maybeFromJson(null), isNull);
    });
  });
}
