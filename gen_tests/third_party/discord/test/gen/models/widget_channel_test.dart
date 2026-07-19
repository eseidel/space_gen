// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('WidgetChannel', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = WidgetChannel(
        id: SnowflakeType('0'),
        name: 'example',
        position: 0,
      );
      final parsed = WidgetChannel.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WidgetChannel.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WidgetChannel.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
