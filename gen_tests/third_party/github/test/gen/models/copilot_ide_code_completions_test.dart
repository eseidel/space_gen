// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotIdeCodeCompletions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotIdeCodeCompletions(entries: <String, dynamic>{});
      final parsed = CopilotIdeCodeCompletions.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotIdeCodeCompletions.maybeFromJson(null), isNull);
    });
  });
}
