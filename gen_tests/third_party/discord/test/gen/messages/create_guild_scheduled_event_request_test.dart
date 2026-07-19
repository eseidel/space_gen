// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateGuildScheduledEventRequest', () {
    test(
      'ExternalScheduledEventCreateRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = ExternalScheduledEventCreateRequest(
          name: 'example',
          scheduledStartTime: DateTime.utc(2024),
          privacyLevel: GuildScheduledEventPrivacyLevels.guildOnly,
          entityMetadata: const EntityMetadataExternal(location: 'example'),
        );
        final parsed = ExternalScheduledEventCreateRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'StageScheduledEventCreateRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = StageScheduledEventCreateRequest(
          name: 'example',
          scheduledStartTime: DateTime.utc(2024),
          privacyLevel: GuildScheduledEventPrivacyLevels.guildOnly,
        );
        final parsed = StageScheduledEventCreateRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'VoiceScheduledEventCreateRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = VoiceScheduledEventCreateRequest(
          name: 'example',
          scheduledStartTime: DateTime.utc(2024),
          privacyLevel: GuildScheduledEventPrivacyLevels.guildOnly,
        );
        final parsed = VoiceScheduledEventCreateRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(CreateGuildScheduledEventRequest.maybeFromJson(null), isNull);
    });
  });
}
