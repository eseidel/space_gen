// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SearchIssuesAndPullRequestsParameter1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SearchIssuesAndPullRequestsParameter1.comments;
      final parsed = SearchIssuesAndPullRequestsParameter1.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SearchIssuesAndPullRequestsParameter1.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SearchIssuesAndPullRequestsParameter1.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in SearchIssuesAndPullRequestsParameter1.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in SearchIssuesAndPullRequestsParameter1.values) {
        expect(
          SearchIssuesAndPullRequestsParameter1.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
