// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntityMetadataVoiceResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntityMetadataVoiceResponse();
      final parsed = EntityMetadataVoiceResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntityMetadataVoiceResponse.maybeFromJson(null), isNull);
    });
  });
}
