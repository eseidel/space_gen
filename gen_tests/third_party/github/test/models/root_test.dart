// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Root', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Root(
        currentUserUrl: UriTemplate('https://example.com/{id}'),
        currentUserAuthorizationsHtmlUrl: UriTemplate(
          'https://example.com/{id}',
        ),
        authorizationsUrl: UriTemplate('https://example.com/{id}'),
        codeSearchUrl: UriTemplate('https://example.com/{id}'),
        commitSearchUrl: UriTemplate('https://example.com/{id}'),
        emailsUrl: UriTemplate('https://example.com/{id}'),
        emojisUrl: UriTemplate('https://example.com/{id}'),
        eventsUrl: UriTemplate('https://example.com/{id}'),
        feedsUrl: UriTemplate('https://example.com/{id}'),
        followersUrl: UriTemplate('https://example.com/{id}'),
        followingUrl: UriTemplate('https://example.com/{id}'),
        gistsUrl: UriTemplate('https://example.com/{id}'),
        issueSearchUrl: UriTemplate('https://example.com/{id}'),
        issuesUrl: UriTemplate('https://example.com/{id}'),
        keysUrl: UriTemplate('https://example.com/{id}'),
        labelSearchUrl: UriTemplate('https://example.com/{id}'),
        notificationsUrl: UriTemplate('https://example.com/{id}'),
        organizationUrl: UriTemplate('https://example.com/{id}'),
        organizationRepositoriesUrl: UriTemplate('https://example.com/{id}'),
        organizationTeamsUrl: UriTemplate('https://example.com/{id}'),
        publicGistsUrl: UriTemplate('https://example.com/{id}'),
        rateLimitUrl: UriTemplate('https://example.com/{id}'),
        repositoryUrl: UriTemplate('https://example.com/{id}'),
        repositorySearchUrl: UriTemplate('https://example.com/{id}'),
        currentUserRepositoriesUrl: UriTemplate('https://example.com/{id}'),
        starredUrl: UriTemplate('https://example.com/{id}'),
        starredGistsUrl: UriTemplate('https://example.com/{id}'),
        userUrl: UriTemplate('https://example.com/{id}'),
        userOrganizationsUrl: UriTemplate('https://example.com/{id}'),
        userRepositoriesUrl: UriTemplate('https://example.com/{id}'),
        userSearchUrl: UriTemplate('https://example.com/{id}'),
      );
      final parsed = Root.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Root.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Root.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
