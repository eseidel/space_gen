// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('BanUserFromGuildRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = BanUserFromGuildRequest();
      final parsed = BanUserFromGuildRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BanUserFromGuildRequest.maybeFromJson(null), isNull);
    });
  });
}
