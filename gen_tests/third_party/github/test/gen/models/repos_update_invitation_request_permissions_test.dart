// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateInvitationRequestPermissions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposUpdateInvitationRequestPermissions.read;
      final parsed = ReposUpdateInvitationRequestPermissions.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposUpdateInvitationRequestPermissions.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposUpdateInvitationRequestPermissions.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReposUpdateInvitationRequestPermissions.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReposUpdateInvitationRequestPermissions.values) {
        expect(
          ReposUpdateInvitationRequestPermissions.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
