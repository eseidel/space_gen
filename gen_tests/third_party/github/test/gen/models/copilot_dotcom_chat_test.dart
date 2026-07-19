// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotDotcomChat', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotDotcomChat(entries: <String, dynamic>{});
      final parsed = CopilotDotcomChat.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotDotcomChat.maybeFromJson(null), isNull);
    });
  });
}
