// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AddedToProjectIssueEventProjectCard', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = AddedToProjectIssueEventProjectCard(
        id: 0,
        url: Uri.parse('https://example.com'),
        projectId: 0,
        projectUrl: Uri.parse('https://example.com'),
        columnName: 'example',
      );
      final parsed = AddedToProjectIssueEventProjectCard.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AddedToProjectIssueEventProjectCard.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AddedToProjectIssueEventProjectCard.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
