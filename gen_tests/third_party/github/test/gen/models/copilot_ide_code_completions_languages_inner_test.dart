// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotIdeCodeCompletionsLanguagesInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotIdeCodeCompletionsLanguagesInner();
      final parsed = CopilotIdeCodeCompletionsLanguagesInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CopilotIdeCodeCompletionsLanguagesInner.maybeFromJson(null),
        isNull,
      );
    });
  });
}
