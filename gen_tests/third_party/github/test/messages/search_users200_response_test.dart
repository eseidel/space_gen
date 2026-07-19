// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SearchUsers200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SearchUsers200Response(
        totalCount: 0,
        incompleteResults: false,
        items: <UserSearchResultItem>[
          UserSearchResultItem(
            login: 'example',
            id: 0,
            nodeId: 'example',
            avatarUrl: Uri.parse('https://example.com'),
            gravatarId: 'example',
            url: Uri.parse('https://example.com'),
            htmlUrl: Uri.parse('https://example.com'),
            followersUrl: Uri.parse('https://example.com'),
            subscriptionsUrl: Uri.parse('https://example.com'),
            organizationsUrl: Uri.parse('https://example.com'),
            reposUrl: Uri.parse('https://example.com'),
            receivedEventsUrl: Uri.parse('https://example.com'),
            type: 'example',
            score: 0,
            followingUrl: 'example',
            gistsUrl: 'example',
            starredUrl: 'example',
            eventsUrl: 'example',
            siteAdmin: false,
          ),
        ],
      );
      final parsed = SearchUsers200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SearchUsers200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SearchUsers200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
