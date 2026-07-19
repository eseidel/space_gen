// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssuesAddSubIssueRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssuesAddSubIssueRequest(subIssueId: 0);
      final parsed = IssuesAddSubIssueRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssuesAddSubIssueRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssuesAddSubIssueRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
