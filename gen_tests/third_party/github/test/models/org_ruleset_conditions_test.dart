// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgRulesetConditions', () {
    test('RepositoryNameAndRefName round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryNameAndRefName(
        repositoryName:
            RepositoryRulesetConditionsRepositoryNameTargetRepositoryName(),
      );
      final parsed = RepositoryNameAndRefName.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('RepositoryIdAndRefName round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryIdAndRefName(
        repositoryId:
            RepositoryRulesetConditionsRepositoryIdTargetRepositoryId(),
      );
      final parsed = RepositoryIdAndRefName.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('RepositoryPropertyAndRefName round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryPropertyAndRefName(
        repositoryProperty:
            RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty(),
      );
      final parsed = RepositoryPropertyAndRefName.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgRulesetConditions.maybeFromJson(null), isNull);
    });
  });
}
