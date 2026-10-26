// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsListOutsideCollaboratorsFilter', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsListOutsideCollaboratorsFilter.n2faDisabled;
      final parsed = OrgsListOutsideCollaboratorsFilter.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgsListOutsideCollaboratorsFilter.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgsListOutsideCollaboratorsFilter.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in OrgsListOutsideCollaboratorsFilter.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in OrgsListOutsideCollaboratorsFilter.values) {
        expect(
          OrgsListOutsideCollaboratorsFilter.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
