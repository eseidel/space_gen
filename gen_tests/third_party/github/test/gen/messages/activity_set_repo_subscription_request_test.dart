// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActivitySetRepoSubscriptionRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActivitySetRepoSubscriptionRequest();
      final parsed = ActivitySetRepoSubscriptionRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActivitySetRepoSubscriptionRequest.maybeFromJson(null), isNull);
    });
  });
}
