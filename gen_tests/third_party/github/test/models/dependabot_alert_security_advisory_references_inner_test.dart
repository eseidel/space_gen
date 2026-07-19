// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotAlertSecurityAdvisoryReferencesInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DependabotAlertSecurityAdvisoryReferencesInner(
        url: Uri.parse('https://example.com'),
      );
      final parsed =
          DependabotAlertSecurityAdvisoryReferencesInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DependabotAlertSecurityAdvisoryReferencesInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotAlertSecurityAdvisoryReferencesInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
