// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsListForReleaseContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsListForReleaseContent.plus1;
      final parsed = ReactionsListForReleaseContent.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReactionsListForReleaseContent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsListForReleaseContent.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReactionsListForReleaseContent.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReactionsListForReleaseContent.values) {
        expect(
          ReactionsListForReleaseContent.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
