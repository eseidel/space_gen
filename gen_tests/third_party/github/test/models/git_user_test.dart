// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitUser', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GitUser();
      final parsed = GitUser.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitUser.maybeFromJson(null), isNull);
    });
  });
}
