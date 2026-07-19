// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateInOrgRequestSquashMergeCommitTitle', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateInOrgRequestSquashMergeCommitTitle.prTitle;
      final parsed =
          ReposCreateInOrgRequestSquashMergeCommitTitle.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposCreateInOrgRequestSquashMergeCommitTitle.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreateInOrgRequestSquashMergeCommitTitle.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in ReposCreateInOrgRequestSquashMergeCommitTitle.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in ReposCreateInOrgRequestSquashMergeCommitTitle.values) {
        expect(
          ReposCreateInOrgRequestSquashMergeCommitTitle.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
