// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsCreateForReleaseRequestContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsCreateForReleaseRequestContent.plus1;
      final parsed = ReactionsCreateForReleaseRequestContent.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsCreateForReleaseRequestContent.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsCreateForReleaseRequestContent.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReactionsCreateForReleaseRequestContent.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReactionsCreateForReleaseRequestContent.values) {
        expect(
          ReactionsCreateForReleaseRequestContent.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
