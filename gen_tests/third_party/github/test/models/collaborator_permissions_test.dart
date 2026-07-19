// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CollaboratorPermissions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CollaboratorPermissions(
        pull: false,
        push: false,
        admin: false,
      );
      final parsed = CollaboratorPermissions.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CollaboratorPermissions.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CollaboratorPermissions.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
