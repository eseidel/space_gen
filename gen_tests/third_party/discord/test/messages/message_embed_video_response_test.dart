// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageEmbedVideoResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MessageEmbedVideoResponse();
      final parsed = MessageEmbedVideoResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageEmbedVideoResponse.maybeFromJson(null), isNull);
    });
  });
}
