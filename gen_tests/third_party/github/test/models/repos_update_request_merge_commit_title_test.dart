// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateRequestMergeCommitTitle', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposUpdateRequestMergeCommitTitle.prTitle;
      final parsed = ReposUpdateRequestMergeCommitTitle.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposUpdateRequestMergeCommitTitle.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposUpdateRequestMergeCommitTitle.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReposUpdateRequestMergeCommitTitle.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReposUpdateRequestMergeCommitTitle.values) {
        expect(
          ReposUpdateRequestMergeCommitTitle.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
