// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAlertItems', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningAlertItems(
        number: const AlertNumber(0),
        createdAt: AlertCreatedAt(DateTime.utc(2024)),
        url: AlertUrl(Uri.parse('https://example.com')),
        htmlUrl: AlertHtmlUrl(Uri.parse('https://example.com')),
        instancesUrl: AlertInstancesUrl(Uri.parse('https://example.com')),
        state: CodeScanningAlertState.open,
        dismissedBy: SimpleUser(
          login: 'octocat',
          id: 1,
          nodeId: 'MDQ6VXNlcjE=',
          avatarUrl: Uri.parse('https://example.com'),
          gravatarId: '41d064eb2195891e12d0413f63227ea7',
          url: Uri.parse('https://example.com'),
          htmlUrl: Uri.parse('https://example.com'),
          followersUrl: Uri.parse('https://example.com'),
          followingUrl:
              'https://api.github.com/users/octocat/following{/other_user}',
          gistsUrl: 'https://api.github.com/users/octocat/gists{/gist_id}',
          starredUrl:
              'https://api.github.com/users/octocat/starred{/owner}{/repo}',
          subscriptionsUrl: Uri.parse('https://example.com'),
          organizationsUrl: Uri.parse('https://example.com'),
          reposUrl: Uri.parse('https://example.com'),
          eventsUrl: 'https://api.github.com/users/octocat/events{/privacy}',
          receivedEventsUrl: Uri.parse('https://example.com'),
          type: 'User',
          siteAdmin: false,
        ),
        dismissedAt: AlertDismissedAt(DateTime.utc(2024)),
        dismissedReason: CodeScanningAlertDismissedReason.falsePositive,
        rule: const CodeScanningAlertRuleSummary(),
        tool: const CodeScanningAnalysisTool(),
        mostRecentInstance: const CodeScanningAlertInstance(),
      );
      final parsed = CodeScanningAlertItems.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAlertItems.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningAlertItems.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
