// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ThreadMemberResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ThreadMemberResponse(
        id: SnowflakeType('0'),
        userId: SnowflakeType('0'),
        joinTimestamp: DateTime.utc(2024),
        flags: 0,
      );
      final parsed = ThreadMemberResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ThreadMemberResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ThreadMemberResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
