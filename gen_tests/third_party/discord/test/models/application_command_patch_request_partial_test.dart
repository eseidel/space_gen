// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandPatchRequestPartial', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandPatchRequestPartial();
      final parsed = ApplicationCommandPatchRequestPartial.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandPatchRequestPartial.maybeFromJson(null), isNull);
    });
  });
}
