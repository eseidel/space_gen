// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AppPermissionsInteractionLimits', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AppPermissionsInteractionLimits.read;
      final parsed = AppPermissionsInteractionLimits.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AppPermissionsInteractionLimits.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AppPermissionsInteractionLimits.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in AppPermissionsInteractionLimits.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AppPermissionsInteractionLimits.values) {
        expect(
          AppPermissionsInteractionLimits.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
