// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsListForIssueContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsListForIssueContent.plus1;
      final parsed = ReactionsListForIssueContent.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReactionsListForIssueContent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsListForIssueContent.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReactionsListForIssueContent.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReactionsListForIssueContent.values) {
        expect(
          ReactionsListForIssueContent.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
