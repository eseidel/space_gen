// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageEditRequestPartial', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MessageEditRequestPartial();
      final parsed = MessageEditRequestPartial.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageEditRequestPartial.maybeFromJson(null), isNull);
    });
  });
}
