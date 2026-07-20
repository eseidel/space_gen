// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotAlertSecurityAdvisoryCvss', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DependabotAlertSecurityAdvisoryCvss(
        score: 0,
        vectorString: 'example',
      );
      final parsed = DependabotAlertSecurityAdvisoryCvss.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependabotAlertSecurityAdvisoryCvss.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotAlertSecurityAdvisoryCvss.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
