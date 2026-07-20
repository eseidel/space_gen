// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('DefaultKeywordListTriggerMetadataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DefaultKeywordListTriggerMetadataResponse(
        allowList: const <String>['example'],
        presets: const <AutomodKeywordPresetType>[
          AutomodKeywordPresetType.profanity,
        ],
      );
      final parsed = DefaultKeywordListTriggerMetadataResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DefaultKeywordListTriggerMetadataResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DefaultKeywordListTriggerMetadataResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
