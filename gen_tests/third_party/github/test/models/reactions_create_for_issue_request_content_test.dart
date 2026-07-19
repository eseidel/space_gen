// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsCreateForIssueRequestContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsCreateForIssueRequestContent.plus1;
      final parsed = ReactionsCreateForIssueRequestContent.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReactionsCreateForIssueRequestContent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsCreateForIssueRequestContent.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReactionsCreateForIssueRequestContent.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReactionsCreateForIssueRequestContent.values) {
        expect(
          ReactionsCreateForIssueRequestContent.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
