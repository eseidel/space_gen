// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectsListForRepoParameter2', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProjectsListForRepoParameter2.open;
      final parsed = ProjectsListForRepoParameter2.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProjectsListForRepoParameter2.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ProjectsListForRepoParameter2.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ProjectsListForRepoParameter2.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ProjectsListForRepoParameter2.values) {
        expect(
          ProjectsListForRepoParameter2.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
