// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MentionSpamUpsertRequestPartial', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MentionSpamUpsertRequestPartial();
      final parsed = MentionSpamUpsertRequestPartial.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MentionSpamUpsertRequestPartial.maybeFromJson(null), isNull);
    });
  });
}
