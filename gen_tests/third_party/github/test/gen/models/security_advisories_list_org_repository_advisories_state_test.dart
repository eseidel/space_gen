// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecurityAdvisoriesListOrgRepositoryAdvisoriesState', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          SecurityAdvisoriesListOrgRepositoryAdvisoriesState.triage;
      final parsed =
          SecurityAdvisoriesListOrgRepositoryAdvisoriesState.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecurityAdvisoriesListOrgRepositoryAdvisoriesState.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecurityAdvisoriesListOrgRepositoryAdvisoriesState.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in SecurityAdvisoriesListOrgRepositoryAdvisoriesState.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in SecurityAdvisoriesListOrgRepositoryAdvisoriesState.values) {
        expect(
          SecurityAdvisoriesListOrgRepositoryAdvisoriesState.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
