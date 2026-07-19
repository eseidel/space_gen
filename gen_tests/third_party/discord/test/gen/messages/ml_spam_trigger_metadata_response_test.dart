// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MlSpamTriggerMetadataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MlSpamTriggerMetadataResponse();
      final parsed = MlSpamTriggerMetadataResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MlSpamTriggerMetadataResponse.maybeFromJson(null), isNull);
    });
  });
}
