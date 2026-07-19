// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('BulkBanUsersResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = BulkBanUsersResponse(
        bannedUsers: <SnowflakeType>[SnowflakeType('0')],
        failedUsers: <SnowflakeType>[SnowflakeType('0')],
      );
      final parsed = BulkBanUsersResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BulkBanUsersResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BulkBanUsersResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
