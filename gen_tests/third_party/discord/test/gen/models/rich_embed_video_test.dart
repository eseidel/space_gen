// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RichEmbedVideo', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RichEmbedVideo();
      final parsed = RichEmbedVideo.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RichEmbedVideo.maybeFromJson(null), isNull);
    });
  });
}
