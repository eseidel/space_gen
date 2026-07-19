// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PollMedia', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PollMedia();
      final parsed = PollMedia.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PollMedia.maybeFromJson(null), isNull);
    });
  });
}
