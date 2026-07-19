// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryAdvisoryUpdateSeverity', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryAdvisoryUpdateSeverity.critical;
      final parsed = RepositoryAdvisoryUpdateSeverity.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryAdvisoryUpdateSeverity.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryAdvisoryUpdateSeverity.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in RepositoryAdvisoryUpdateSeverity.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in RepositoryAdvisoryUpdateSeverity.values) {
        expect(
          RepositoryAdvisoryUpdateSeverity.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
