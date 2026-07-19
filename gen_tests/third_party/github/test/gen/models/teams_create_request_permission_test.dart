// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamsCreateRequestPermission', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamsCreateRequestPermission.pull;
      final parsed = TeamsCreateRequestPermission.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamsCreateRequestPermission.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamsCreateRequestPermission.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in TeamsCreateRequestPermission.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in TeamsCreateRequestPermission.values) {
        expect(
          TeamsCreateRequestPermission.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
