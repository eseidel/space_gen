// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AuditLogEntryResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = AuditLogEntryResponse(
        id: SnowflakeType('0'),
        actionType: AuditLogActionTypes.guildUpdate,
        userId: SnowflakeType('0'),
        targetId: SnowflakeType('0'),
      );
      final parsed = AuditLogEntryResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AuditLogEntryResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AuditLogEntryResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
