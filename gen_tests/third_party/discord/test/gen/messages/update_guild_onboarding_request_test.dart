// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateGuildOnboardingRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UpdateGuildOnboardingRequest();
      final parsed = UpdateGuildOnboardingRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdateGuildOnboardingRequest.maybeFromJson(null), isNull);
    });
  });
}
