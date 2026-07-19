// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssuesListCommentsForRepoParameter3', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssuesListCommentsForRepoParameter3.asc;
      final parsed = IssuesListCommentsForRepoParameter3.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssuesListCommentsForRepoParameter3.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssuesListCommentsForRepoParameter3.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in IssuesListCommentsForRepoParameter3.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in IssuesListCommentsForRepoParameter3.values) {
        expect(
          IssuesListCommentsForRepoParameter3.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
