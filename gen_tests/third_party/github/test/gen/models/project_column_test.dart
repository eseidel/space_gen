// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectColumn', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ProjectColumn(
        url: Uri.parse('https://example.com'),
        projectUrl: Uri.parse('https://example.com'),
        cardsUrl: Uri.parse('https://example.com'),
        id: 42,
        nodeId: 'MDEzOlByb2plY3RDb2x1bW4zNjc=',
        name: 'Remaining tasks',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
      );
      final parsed = ProjectColumn.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProjectColumn.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ProjectColumn.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
