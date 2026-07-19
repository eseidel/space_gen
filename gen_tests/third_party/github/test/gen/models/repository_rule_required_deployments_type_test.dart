// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleRequiredDeploymentsType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          RepositoryRuleRequiredDeploymentsType.requiredDeployments;
      final parsed = RepositoryRuleRequiredDeploymentsType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryRuleRequiredDeploymentsType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleRequiredDeploymentsType.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in RepositoryRuleRequiredDeploymentsType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in RepositoryRuleRequiredDeploymentsType.values) {
        expect(
          RepositoryRuleRequiredDeploymentsType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
