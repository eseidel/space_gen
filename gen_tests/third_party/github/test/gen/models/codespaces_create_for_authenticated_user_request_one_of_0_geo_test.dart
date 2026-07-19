// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesCreateForAuthenticatedUserRequestOneOf0Geo', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          CodespacesCreateForAuthenticatedUserRequestOneOf0Geo.europeWest;
      final parsed =
          CodespacesCreateForAuthenticatedUserRequestOneOf0Geo.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodespacesCreateForAuthenticatedUserRequestOneOf0Geo.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CodespacesCreateForAuthenticatedUserRequestOneOf0Geo.maybeFromJson(
              '__invalid_enum_value__',
            ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in CodespacesCreateForAuthenticatedUserRequestOneOf0Geo.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in CodespacesCreateForAuthenticatedUserRequestOneOf0Geo.values) {
        expect(
          CodespacesCreateForAuthenticatedUserRequestOneOf0Geo.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
