// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecurityAndAnalysisAdvancedSecurity', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SecurityAndAnalysisAdvancedSecurity();
      final parsed = SecurityAndAnalysisAdvancedSecurity.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SecurityAndAnalysisAdvancedSecurity.maybeFromJson(null), isNull);
    });
  });
}
