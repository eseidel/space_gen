// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssueSearchResultItemPullRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = IssueSearchResultItemPullRequest(
        diffUrl: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        patchUrl: Uri.parse('https://example.com'),
        url: Uri.parse('https://example.com'),
      );
      final parsed = IssueSearchResultItemPullRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssueSearchResultItemPullRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            IssueSearchResultItemPullRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
