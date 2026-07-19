// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleEnforcement', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleEnforcement.disabled;
      final parsed = RepositoryRuleEnforcement.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryRuleEnforcement.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleEnforcement.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in RepositoryRuleEnforcement.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in RepositoryRuleEnforcement.values) {
        expect(
          RepositoryRuleEnforcement.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
