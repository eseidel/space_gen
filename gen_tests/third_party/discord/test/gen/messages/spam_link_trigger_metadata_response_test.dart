// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('SpamLinkTriggerMetadataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SpamLinkTriggerMetadataResponse();
      final parsed = SpamLinkTriggerMetadataResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SpamLinkTriggerMetadataResponse.maybeFromJson(null), isNull);
    });
  });
}
