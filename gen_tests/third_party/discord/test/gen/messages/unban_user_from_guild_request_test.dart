// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UnbanUserFromGuildRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UnbanUserFromGuildRequest();
      final parsed = UnbanUserFromGuildRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UnbanUserFromGuildRequest.maybeFromJson(null), isNull);
    });
  });
}
