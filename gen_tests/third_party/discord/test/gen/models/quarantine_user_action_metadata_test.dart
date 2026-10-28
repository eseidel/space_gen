// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('QuarantineUserActionMetadata', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = QuarantineUserActionMetadata();
      final parsed = QuarantineUserActionMetadata.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(QuarantineUserActionMetadata.maybeFromJson(null), isNull);
    });
  });
}
