// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateVoiceStateRequestPartial', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UpdateVoiceStateRequestPartial();
      final parsed = UpdateVoiceStateRequestPartial.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdateVoiceStateRequestPartial.maybeFromJson(null), isNull);
    });
  });
}
