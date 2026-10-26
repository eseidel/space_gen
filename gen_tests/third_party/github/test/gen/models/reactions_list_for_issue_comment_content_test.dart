// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsListForIssueCommentContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsListForIssueCommentContent.plus1;
      final parsed = ReactionsListForIssueCommentContent.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReactionsListForIssueCommentContent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsListForIssueCommentContent.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReactionsListForIssueCommentContent.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReactionsListForIssueCommentContent.values) {
        expect(
          ReactionsListForIssueCommentContent.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
