// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsListMembershipsForAuthenticatedUserState', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsListMembershipsForAuthenticatedUserState.active;
      final parsed = OrgsListMembershipsForAuthenticatedUserState.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        OrgsListMembershipsForAuthenticatedUserState.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgsListMembershipsForAuthenticatedUserState.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in OrgsListMembershipsForAuthenticatedUserState.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in OrgsListMembershipsForAuthenticatedUserState.values) {
        expect(
          OrgsListMembershipsForAuthenticatedUserState.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
