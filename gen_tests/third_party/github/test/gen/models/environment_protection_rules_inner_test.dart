// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('EnvironmentProtectionRulesInner', () {
    test(
      'EnvironmentProtectionRulesInnerAnyOf0 round-trips via maybeFromJson/toJson',
      () {
        const instance = EnvironmentProtectionRulesInnerAnyOf0(
          id: 3515,
          nodeId: 'MDQ6R2F0ZTM1MTU=',
          type: 'wait_timer',
        );
        final parsed = EnvironmentProtectionRulesInnerAnyOf0.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'EnvironmentProtectionRulesInnerAnyOf1 round-trips via maybeFromJson/toJson',
      () {
        const instance = EnvironmentProtectionRulesInnerAnyOf1(
          id: 3755,
          nodeId: 'MDQ6R2F0ZTM3NTU=',
          type: 'required_reviewers',
        );
        final parsed = EnvironmentProtectionRulesInnerAnyOf1.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'EnvironmentProtectionRulesInnerAnyOf2 round-trips via maybeFromJson/toJson',
      () {
        const instance = EnvironmentProtectionRulesInnerAnyOf2(
          id: 3515,
          nodeId: 'MDQ6R2F0ZTM1MTU=',
          type: 'branch_policy',
        );
        final parsed = EnvironmentProtectionRulesInnerAnyOf2.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(EnvironmentProtectionRulesInner.maybeFromJson(null), isNull);
    });
  });
}
