// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('KeywordTriggerMetadata', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = KeywordTriggerMetadata();
      final parsed = KeywordTriggerMetadata.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(KeywordTriggerMetadata.maybeFromJson(null), isNull);
    });
  });
}
