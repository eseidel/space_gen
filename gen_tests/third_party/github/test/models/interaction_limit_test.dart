// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('InteractionLimit', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = InteractionLimit(limit: InteractionGroup.existingUsers);
      final parsed = InteractionLimit.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InteractionLimit.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InteractionLimit.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
