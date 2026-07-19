// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamsUpdateInOrgRequestPermission', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamsUpdateInOrgRequestPermission.pull;
      final parsed = TeamsUpdateInOrgRequestPermission.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamsUpdateInOrgRequestPermission.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamsUpdateInOrgRequestPermission.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in TeamsUpdateInOrgRequestPermission.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in TeamsUpdateInOrgRequestPermission.values) {
        expect(
          TeamsUpdateInOrgRequestPermission.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
