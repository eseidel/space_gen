// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateMyGuildMemberRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UpdateMyGuildMemberRequest();
      final parsed = UpdateMyGuildMemberRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdateMyGuildMemberRequest.maybeFromJson(null), isNull);
    });
  });
}
