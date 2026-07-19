// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleParamsStatusCheckConfiguration', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleParamsStatusCheckConfiguration(
        context: 'example',
      );
      final parsed = RepositoryRuleParamsStatusCheckConfiguration.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleParamsStatusCheckConfiguration.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleParamsStatusCheckConfiguration.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
