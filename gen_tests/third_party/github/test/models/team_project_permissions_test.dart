// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamProjectPermissions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamProjectPermissions(
        read: false,
        write: false,
        admin: false,
      );
      final parsed = TeamProjectPermissions.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamProjectPermissions.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamProjectPermissions.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
