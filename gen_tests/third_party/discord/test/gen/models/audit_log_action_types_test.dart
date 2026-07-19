// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AuditLogActionTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AuditLogActionTypes.guildUpdate;
      final parsed = AuditLogActionTypes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AuditLogActionTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AuditLogActionTypes.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in AuditLogActionTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AuditLogActionTypes.values) {
        expect(AuditLogActionTypes.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
