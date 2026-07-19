// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CheckSuitePreferencePreferencesAutoTriggerChecksInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CheckSuitePreferencePreferencesAutoTriggerChecksInner(
        appId: 0,
        setting: false,
      );
      final parsed =
          CheckSuitePreferencePreferencesAutoTriggerChecksInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CheckSuitePreferencePreferencesAutoTriggerChecksInner.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CheckSuitePreferencePreferencesAutoTriggerChecksInner.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
