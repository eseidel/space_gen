// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecurityConfiguration', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeSecurityConfiguration();
      final parsed = CodeSecurityConfiguration.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeSecurityConfiguration.maybeFromJson(null), isNull);
    });
  });
}
