// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PruneGuildRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PruneGuildRequest();
      final parsed = PruneGuildRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PruneGuildRequest.maybeFromJson(null), isNull);
    });
  });
}
