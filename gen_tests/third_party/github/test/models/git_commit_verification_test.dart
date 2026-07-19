// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitCommitVerification', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GitCommitVerification(
        verified: false,
        reason: 'example',
        signature: 'example',
        payload: 'example',
        verifiedAt: 'example',
      );
      final parsed = GitCommitVerification.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitCommitVerification.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitCommitVerification.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
