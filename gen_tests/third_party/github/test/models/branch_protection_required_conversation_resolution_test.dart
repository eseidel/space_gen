// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('BranchProtectionRequiredConversationResolution', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BranchProtectionRequiredConversationResolution();
      final parsed =
          BranchProtectionRequiredConversationResolution.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        BranchProtectionRequiredConversationResolution.maybeFromJson(null),
        isNull,
      );
    });
  });
}
