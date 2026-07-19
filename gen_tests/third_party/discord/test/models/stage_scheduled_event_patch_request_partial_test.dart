// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('StageScheduledEventPatchRequestPartial', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = StageScheduledEventPatchRequestPartial();
      final parsed = StageScheduledEventPatchRequestPartial.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        StageScheduledEventPatchRequestPartial.maybeFromJson(null),
        isNull,
      );
    });
  });
}
