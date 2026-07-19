// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActivityMarkRepoNotificationsAsRead202Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActivityMarkRepoNotificationsAsRead202Response();
      final parsed =
          ActivityMarkRepoNotificationsAsRead202Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActivityMarkRepoNotificationsAsRead202Response.maybeFromJson(null),
        isNull,
      );
    });
  });
}
