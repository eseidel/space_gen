// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepoSearchResultItemPermissions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepoSearchResultItemPermissions(
        admin: false,
        push: false,
        pull: false,
      );
      final parsed = RepoSearchResultItemPermissions.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepoSearchResultItemPermissions.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            RepoSearchResultItemPermissions.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
