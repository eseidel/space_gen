// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotIdeChat', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotIdeChat(entries: <String, dynamic>{});
      final parsed = CopilotIdeChat.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotIdeChat.maybeFromJson(null), isNull);
    });
  });
}
