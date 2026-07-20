// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('SoundboardPatchRequestPartial', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SoundboardPatchRequestPartial();
      final parsed = SoundboardPatchRequestPartial.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SoundboardPatchRequestPartial.maybeFromJson(null), isNull);
    });
  });
}
