// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotDotcomChatModelsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotDotcomChatModelsInner();
      final parsed = CopilotDotcomChatModelsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotDotcomChatModelsInner.maybeFromJson(null), isNull);
    });
  });
}
