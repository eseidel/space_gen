// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrganizationDependabotSecret', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrganizationDependabotSecret(
        name: 'SECRET_TOKEN',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        visibility: OrganizationDependabotSecretVisibility.all,
      );
      final parsed = OrganizationDependabotSecret.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrganizationDependabotSecret.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrganizationDependabotSecret.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
