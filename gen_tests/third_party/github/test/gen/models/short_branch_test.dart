// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ShortBranch', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ShortBranch(
        name: 'example',
        commit: ShortBranchCommit(
          sha: 'example',
          url: Uri.parse('https://example.com'),
        ),
        protected: false,
      );
      final parsed = ShortBranch.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ShortBranch.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ShortBranch.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
