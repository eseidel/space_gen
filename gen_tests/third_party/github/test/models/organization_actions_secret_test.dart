// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrganizationActionsSecret', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrganizationActionsSecret(
        name: 'SECRET_TOKEN',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        visibility: OrganizationActionsSecretVisibility.all,
      );
      final parsed = OrganizationActionsSecret.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrganizationActionsSecret.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrganizationActionsSecret.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
