// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RemovedFromProjectIssueEventProjectCard', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RemovedFromProjectIssueEventProjectCard(
        id: 0,
        url: Uri.parse('https://example.com'),
        projectId: 0,
        projectUrl: Uri.parse('https://example.com'),
        columnName: 'example',
      );
      final parsed = RemovedFromProjectIssueEventProjectCard.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RemovedFromProjectIssueEventProjectCard.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RemovedFromProjectIssueEventProjectCard.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
