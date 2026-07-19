// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('EnvironmentProtectionRulesInnerAnyOf1ReviewersInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EnvironmentProtectionRulesInnerAnyOf1ReviewersInner();
      final parsed =
          EnvironmentProtectionRulesInnerAnyOf1ReviewersInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        EnvironmentProtectionRulesInnerAnyOf1ReviewersInner.maybeFromJson(null),
        isNull,
      );
    });
  });
}
