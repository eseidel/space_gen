// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssuesReprioritizeSubIssueRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssuesReprioritizeSubIssueRequest(subIssueId: 0);
      final parsed = IssuesReprioritizeSubIssueRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssuesReprioritizeSubIssueRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssuesReprioritizeSubIssueRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
