// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCanApprovePullRequestReviews', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsCanApprovePullRequestReviews(false);
      final parsed = ActionsCanApprovePullRequestReviews.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsCanApprovePullRequestReviews.maybeFromJson(null), isNull);
    });
  });
}
