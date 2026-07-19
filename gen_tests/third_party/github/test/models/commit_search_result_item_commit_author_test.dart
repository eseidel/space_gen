// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CommitSearchResultItemCommitAuthor', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CommitSearchResultItemCommitAuthor(
        name: 'example',
        email: 'example',
        date: DateTime.utc(2024),
      );
      final parsed = CommitSearchResultItemCommitAuthor.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CommitSearchResultItemCommitAuthor.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CommitSearchResultItemCommitAuthor.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
