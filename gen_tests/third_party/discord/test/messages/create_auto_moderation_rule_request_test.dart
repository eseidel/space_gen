// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateAutoModerationRuleRequest', () {
    test(
      'DefaultKeywordListUpsertRequest round-trips via maybeFromJson/toJson',
      () {
        const instance = DefaultKeywordListUpsertRequest(
          name: 'example',
          eventType: AutomodEventType.messageSend,
          triggerMetadata: DefaultKeywordListTriggerMetadata(),
        );
        final parsed = DefaultKeywordListUpsertRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('KeywordUpsertRequest round-trips via maybeFromJson/toJson', () {
      const instance = KeywordUpsertRequest(
        name: 'example',
        eventType: AutomodEventType.messageSend,
      );
      final parsed = KeywordUpsertRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('MlSpamUpsertRequest round-trips via maybeFromJson/toJson', () {
      const instance = MlSpamUpsertRequest(
        name: 'example',
        eventType: AutomodEventType.messageSend,
      );
      final parsed = MlSpamUpsertRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('MentionSpamUpsertRequest round-trips via maybeFromJson/toJson', () {
      const instance = MentionSpamUpsertRequest(
        name: 'example',
        eventType: AutomodEventType.messageSend,
      );
      final parsed = MentionSpamUpsertRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateAutoModerationRuleRequest.maybeFromJson(null), isNull);
    });
  });
}
