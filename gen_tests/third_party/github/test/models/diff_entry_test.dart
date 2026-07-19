// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DiffEntry', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DiffEntry(
        sha: 'bbcd538c8e72b8c175046e27cc8f907076331401',
        filename: 'file1.txt',
        status: DiffEntryStatus.added,
        additions: 103,
        deletions: 21,
        changes: 124,
        blobUrl: Uri.parse('https://example.com'),
        rawUrl: Uri.parse('https://example.com'),
        contentsUrl: Uri.parse('https://example.com'),
      );
      final parsed = DiffEntry.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DiffEntry.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DiffEntry.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
