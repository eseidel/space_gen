// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SearchResultTextMatches', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SearchResultTextMatches(
        <SearchResultTextMatchesInner>[SearchResultTextMatchesInner()],
      );
      final parsed = SearchResultTextMatches.maybeFromJson(instance.toJson())!;
      expect(parsed.toJson(), equals(instance.toJson()));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SearchResultTextMatches.maybeFromJson(null), isNull);
    });
  });
}
