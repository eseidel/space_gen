// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('FullRepositoryPermissions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = FullRepositoryPermissions(
        admin: false,
        push: false,
        pull: false,
      );
      final parsed = FullRepositoryPermissions.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FullRepositoryPermissions.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => FullRepositoryPermissions.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
