// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsCreateForIssueCommentRequestContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsCreateForIssueCommentRequestContent.plus1;
      final parsed = ReactionsCreateForIssueCommentRequestContent.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsCreateForIssueCommentRequestContent.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsCreateForIssueCommentRequestContent.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReactionsCreateForIssueCommentRequestContent.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReactionsCreateForIssueCommentRequestContent.values) {
        expect(
          ReactionsCreateForIssueCommentRequestContent.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
