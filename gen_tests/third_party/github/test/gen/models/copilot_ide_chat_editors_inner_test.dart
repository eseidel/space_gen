// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotIdeChatEditorsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotIdeChatEditorsInner();
      final parsed = CopilotIdeChatEditorsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotIdeChatEditorsInner.maybeFromJson(null), isNull);
    });
  });
}
