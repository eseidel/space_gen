// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssueSearchResultItemSubIssuesSummary', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssueSearchResultItemSubIssuesSummary(
        total: 0,
        completed: 0,
        percentCompleted: 0,
      );
      final parsed = IssueSearchResultItemSubIssuesSummary.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssueSearchResultItemSubIssuesSummary.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssueSearchResultItemSubIssuesSummary.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
