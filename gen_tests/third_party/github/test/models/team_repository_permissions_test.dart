// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamRepositoryPermissions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamRepositoryPermissions(
        admin: false,
        pull: false,
        push: false,
      );
      final parsed = TeamRepositoryPermissions.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamRepositoryPermissions.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamRepositoryPermissions.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
