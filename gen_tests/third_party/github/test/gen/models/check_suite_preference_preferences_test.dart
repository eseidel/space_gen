// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CheckSuitePreferencePreferences', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CheckSuitePreferencePreferences();
      final parsed = CheckSuitePreferencePreferences.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CheckSuitePreferencePreferences.maybeFromJson(null), isNull);
    });
  });
}
