// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MentionSpamTriggerMetadataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MentionSpamTriggerMetadataResponse(
        mentionTotalLimit: 0,
        mentionRaidProtectionEnabled: false,
      );
      final parsed = MentionSpamTriggerMetadataResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MentionSpamTriggerMetadataResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MentionSpamTriggerMetadataResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
