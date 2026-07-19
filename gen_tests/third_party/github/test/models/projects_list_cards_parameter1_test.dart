// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectsListCardsParameter1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProjectsListCardsParameter1.all;
      final parsed = ProjectsListCardsParameter1.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProjectsListCardsParameter1.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ProjectsListCardsParameter1.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ProjectsListCardsParameter1.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ProjectsListCardsParameter1.values) {
        expect(
          ProjectsListCardsParameter1.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
