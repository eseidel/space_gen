// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateRequestMergeCommitMessage', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposUpdateRequestMergeCommitMessage.prBody;
      final parsed = ReposUpdateRequestMergeCommitMessage.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposUpdateRequestMergeCommitMessage.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposUpdateRequestMergeCommitMessage.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReposUpdateRequestMergeCommitMessage.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReposUpdateRequestMergeCommitMessage.values) {
        expect(
          ReposUpdateRequestMergeCommitMessage.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
