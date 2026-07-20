// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('WelcomeScreenPatchRequestPartial', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = WelcomeScreenPatchRequestPartial();
      final parsed = WelcomeScreenPatchRequestPartial.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WelcomeScreenPatchRequestPartial.maybeFromJson(null), isNull);
    });
  });
}
