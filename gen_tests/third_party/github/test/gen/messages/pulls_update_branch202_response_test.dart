// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullsUpdateBranch202Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullsUpdateBranch202Response();
      final parsed = PullsUpdateBranch202Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullsUpdateBranch202Response.maybeFromJson(null), isNull);
    });
  });
}
