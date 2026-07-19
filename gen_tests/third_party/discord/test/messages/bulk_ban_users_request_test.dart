// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('BulkBanUsersRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = BulkBanUsersRequest(
        userIds: <SnowflakeType>[SnowflakeType('0')],
      );
      final parsed = BulkBanUsersRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BulkBanUsersRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BulkBanUsersRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
