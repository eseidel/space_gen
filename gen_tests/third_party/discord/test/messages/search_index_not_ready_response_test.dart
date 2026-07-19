// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('SearchIndexNotReadyResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SearchIndexNotReadyResponse(
        message: 'example',
        code: 0,
        documentsIndexed: 0,
        retryAfter: 0,
      );
      final parsed = SearchIndexNotReadyResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SearchIndexNotReadyResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SearchIndexNotReadyResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
