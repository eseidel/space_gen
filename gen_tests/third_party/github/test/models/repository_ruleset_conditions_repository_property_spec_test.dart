// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRulesetConditionsRepositoryPropertySpec', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRulesetConditionsRepositoryPropertySpec(
        name: 'example',
        propertyValues: <String>['example'],
      );
      final parsed =
          RepositoryRulesetConditionsRepositoryPropertySpec.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRulesetConditionsRepositoryPropertySpec.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRulesetConditionsRepositoryPropertySpec.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
