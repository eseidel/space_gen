// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamFullNotificationSetting', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamFullNotificationSetting.notificationsEnabled;
      final parsed = TeamFullNotificationSetting.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamFullNotificationSetting.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            TeamFullNotificationSetting.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in TeamFullNotificationSetting.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in TeamFullNotificationSetting.values) {
        expect(
          TeamFullNotificationSetting.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
