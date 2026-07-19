// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SearchResultTextMatchesInnerMatchesInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SearchResultTextMatchesInnerMatchesInner();
      final parsed = SearchResultTextMatchesInnerMatchesInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SearchResultTextMatchesInnerMatchesInner.maybeFromJson(null),
        isNull,
      );
    });
  });
}
