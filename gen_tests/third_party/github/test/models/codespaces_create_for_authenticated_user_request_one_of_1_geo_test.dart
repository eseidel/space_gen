// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesCreateForAuthenticatedUserRequestOneOf1Geo', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          CodespacesCreateForAuthenticatedUserRequestOneOf1Geo.europeWest;
      final parsed =
          CodespacesCreateForAuthenticatedUserRequestOneOf1Geo.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodespacesCreateForAuthenticatedUserRequestOneOf1Geo.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CodespacesCreateForAuthenticatedUserRequestOneOf1Geo.maybeFromJson(
              '__invalid_enum_value__',
            ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in CodespacesCreateForAuthenticatedUserRequestOneOf1Geo.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in CodespacesCreateForAuthenticatedUserRequestOneOf1Geo.values) {
        expect(
          CodespacesCreateForAuthenticatedUserRequestOneOf1Geo.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
