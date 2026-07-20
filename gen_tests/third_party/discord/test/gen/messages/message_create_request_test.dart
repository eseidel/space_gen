// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageCreateRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MessageCreateRequest();
      final parsed = MessageCreateRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageCreateRequest.maybeFromJson(null), isNull);
    });
  });
}
