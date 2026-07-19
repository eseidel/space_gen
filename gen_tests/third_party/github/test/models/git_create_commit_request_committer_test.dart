// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitCreateCommitRequestCommitter', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GitCreateCommitRequestCommitter();
      final parsed = GitCreateCommitRequestCommitter.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitCreateCommitRequestCommitter.maybeFromJson(null), isNull);
    });
  });
}
