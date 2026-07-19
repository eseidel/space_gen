// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('DefaultKeywordListTriggerMetadata', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DefaultKeywordListTriggerMetadata();
      final parsed = DefaultKeywordListTriggerMetadata.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DefaultKeywordListTriggerMetadata.maybeFromJson(null), isNull);
    });
  });
}
