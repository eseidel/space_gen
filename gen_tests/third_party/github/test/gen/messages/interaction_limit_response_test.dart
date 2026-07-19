// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('InteractionLimitResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = InteractionLimitResponse(
        limit: InteractionGroup.existingUsers,
        origin: 'repository',
        expiresAt: DateTime.utc(2024),
      );
      final parsed = InteractionLimitResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InteractionLimitResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InteractionLimitResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
