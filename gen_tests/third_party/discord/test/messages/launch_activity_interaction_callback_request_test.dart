// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('LaunchActivityInteractionCallbackRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = LaunchActivityInteractionCallbackRequest();
      final parsed = LaunchActivityInteractionCallbackRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        LaunchActivityInteractionCallbackRequest.maybeFromJson(null),
        isNull,
      );
    });
  });
}
