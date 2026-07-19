// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('VoiceRegionResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = VoiceRegionResponse(
        id: 'example',
        name: 'example',
        custom: false,
        deprecated: false,
        optimal: false,
      );
      final parsed = VoiceRegionResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(VoiceRegionResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => VoiceRegionResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
