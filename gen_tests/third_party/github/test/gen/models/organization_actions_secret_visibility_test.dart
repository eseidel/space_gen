// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrganizationActionsSecretVisibility', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrganizationActionsSecretVisibility.all;
      final parsed = OrganizationActionsSecretVisibility.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrganizationActionsSecretVisibility.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrganizationActionsSecretVisibility.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in OrganizationActionsSecretVisibility.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in OrganizationActionsSecretVisibility.values) {
        expect(
          OrganizationActionsSecretVisibility.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
