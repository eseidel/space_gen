// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsListMembershipsForAuthenticatedUserParameter0', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsListMembershipsForAuthenticatedUserParameter0.active;
      final parsed =
          OrgsListMembershipsForAuthenticatedUserParameter0.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        OrgsListMembershipsForAuthenticatedUserParameter0.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgsListMembershipsForAuthenticatedUserParameter0.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in OrgsListMembershipsForAuthenticatedUserParameter0.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in OrgsListMembershipsForAuthenticatedUserParameter0.values) {
        expect(
          OrgsListMembershipsForAuthenticatedUserParameter0.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
