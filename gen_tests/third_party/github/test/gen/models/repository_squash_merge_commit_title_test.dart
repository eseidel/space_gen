// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositorySquashMergeCommitTitle', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositorySquashMergeCommitTitle.prTitle;
      final parsed = RepositorySquashMergeCommitTitle.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositorySquashMergeCommitTitle.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositorySquashMergeCommitTitle.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in RepositorySquashMergeCommitTitle.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in RepositorySquashMergeCommitTitle.values) {
        expect(
          RepositorySquashMergeCommitTitle.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
