// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ConvertedNoteToIssueIssueEventProjectCard', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ConvertedNoteToIssueIssueEventProjectCard(
        id: 0,
        url: Uri.parse('https://example.com'),
        projectId: 0,
        projectUrl: Uri.parse('https://example.com'),
        columnName: 'example',
      );
      final parsed = ConvertedNoteToIssueIssueEventProjectCard.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ConvertedNoteToIssueIssueEventProjectCard.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ConvertedNoteToIssueIssueEventProjectCard.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
