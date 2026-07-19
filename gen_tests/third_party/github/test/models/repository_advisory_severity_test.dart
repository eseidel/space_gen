// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryAdvisorySeverity', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryAdvisorySeverity.critical;
      final parsed = RepositoryAdvisorySeverity.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryAdvisorySeverity.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            RepositoryAdvisorySeverity.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in RepositoryAdvisorySeverity.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in RepositoryAdvisorySeverity.values) {
        expect(
          RepositoryAdvisorySeverity.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
