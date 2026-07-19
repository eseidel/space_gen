// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotAlertSecurityAdvisoryIdentifiersInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependabotAlertSecurityAdvisoryIdentifiersInner(
        type: DependabotAlertSecurityAdvisoryIdentifiersInnerType.cve,
        value: 'example',
      );
      final parsed =
          DependabotAlertSecurityAdvisoryIdentifiersInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DependabotAlertSecurityAdvisoryIdentifiersInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotAlertSecurityAdvisoryIdentifiersInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
