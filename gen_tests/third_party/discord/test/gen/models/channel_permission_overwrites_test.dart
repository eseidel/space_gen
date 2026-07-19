// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChannelPermissionOverwrites', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChannelPermissionOverwrites.role;
      final parsed = ChannelPermissionOverwrites.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChannelPermissionOverwrites.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChannelPermissionOverwrites.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ChannelPermissionOverwrites.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ChannelPermissionOverwrites.values) {
        expect(
          ChannelPermissionOverwrites.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
