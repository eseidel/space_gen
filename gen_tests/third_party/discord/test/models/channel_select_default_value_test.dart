// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChannelSelectDefaultValue', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ChannelSelectDefaultValue(id: SnowflakeType('0'));
      final parsed = ChannelSelectDefaultValue.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChannelSelectDefaultValue.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChannelSelectDefaultValue.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
