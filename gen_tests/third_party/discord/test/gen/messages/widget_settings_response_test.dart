// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('WidgetSettingsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = WidgetSettingsResponse(
        enabled: false,
        channelId: SnowflakeType('0'),
      );
      final parsed = WidgetSettingsResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WidgetSettingsResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WidgetSettingsResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
