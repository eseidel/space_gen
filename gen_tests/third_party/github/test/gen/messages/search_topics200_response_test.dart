// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SearchTopics200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SearchTopics200Response(
        totalCount: 0,
        incompleteResults: false,
        items: <TopicSearchResultItem>[
          TopicSearchResultItem(
            name: 'example',
            displayName: 'example',
            shortDescription: 'example',
            description: 'example',
            createdBy: 'example',
            released: 'example',
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
            featured: false,
            curated: false,
            score: 0,
          ),
        ],
      );
      final parsed = SearchTopics200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SearchTopics200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SearchTopics200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
