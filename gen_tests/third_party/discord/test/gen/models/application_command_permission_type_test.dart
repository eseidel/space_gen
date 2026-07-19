// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandPermissionType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandPermissionType.role;
      final parsed = ApplicationCommandPermissionType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandPermissionType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandPermissionType.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ApplicationCommandPermissionType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ApplicationCommandPermissionType.values) {
        expect(
          ApplicationCommandPermissionType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
