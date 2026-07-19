// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateInformationAboutPagesSiteRequestSourceAnyOf1Path', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          ReposUpdateInformationAboutPagesSiteRequestSourceAnyOf1Path.a;
      final parsed =
          ReposUpdateInformationAboutPagesSiteRequestSourceAnyOf1Path.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposUpdateInformationAboutPagesSiteRequestSourceAnyOf1Path.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ReposUpdateInformationAboutPagesSiteRequestSourceAnyOf1Path.maybeFromJson(
              '__invalid_enum_value__',
            ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in ReposUpdateInformationAboutPagesSiteRequestSourceAnyOf1Path
              .values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in ReposUpdateInformationAboutPagesSiteRequestSourceAnyOf1Path
              .values) {
        expect(
          ReposUpdateInformationAboutPagesSiteRequestSourceAnyOf1Path.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
