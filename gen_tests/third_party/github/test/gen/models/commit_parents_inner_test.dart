// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CommitParentsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CommitParentsInner(
        sha: '7638417db6d59f3c431d3e1f261cc637155684cd',
        url: Uri.parse('https://example.com'),
      );
      final parsed = CommitParentsInner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CommitParentsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CommitParentsInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
