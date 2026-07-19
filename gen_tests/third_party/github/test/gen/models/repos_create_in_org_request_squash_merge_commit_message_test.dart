// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateInOrgRequestSquashMergeCommitMessage', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateInOrgRequestSquashMergeCommitMessage.prBody;
      final parsed =
          ReposCreateInOrgRequestSquashMergeCommitMessage.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposCreateInOrgRequestSquashMergeCommitMessage.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreateInOrgRequestSquashMergeCommitMessage.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in ReposCreateInOrgRequestSquashMergeCommitMessage.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in ReposCreateInOrgRequestSquashMergeCommitMessage.values) {
        expect(
          ReposCreateInOrgRequestSquashMergeCommitMessage.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
