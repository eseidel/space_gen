// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('QuarantineUserActionMetadataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = QuarantineUserActionMetadataResponse();
      final parsed = QuarantineUserActionMetadataResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(QuarantineUserActionMetadataResponse.maybeFromJson(null), isNull);
    });
  });
}
