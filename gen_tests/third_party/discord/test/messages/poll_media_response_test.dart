// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PollMediaResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PollMediaResponse();
      final parsed = PollMediaResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PollMediaResponse.maybeFromJson(null), isNull);
    });
  });
}
