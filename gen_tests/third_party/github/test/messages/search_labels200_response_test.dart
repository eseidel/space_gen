// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SearchLabels200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SearchLabels200Response(
        totalCount: 0,
        incompleteResults: false,
        items: <LabelSearchResultItem>[
          LabelSearchResultItem(
            id: 0,
            nodeId: 'example',
            url: Uri.parse('https://example.com'),
            name: 'example',
            color: 'example',
            default_: false,
            description: 'example',
            score: 0,
          ),
        ],
      );
      final parsed = SearchLabels200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SearchLabels200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SearchLabels200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
