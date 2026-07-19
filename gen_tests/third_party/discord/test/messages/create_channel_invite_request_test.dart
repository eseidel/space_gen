// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateChannelInviteRequest', () {
    test('CreateGroupDmInviteRequest round-trips via maybeFromJson/toJson', () {
      const instance = CreateGroupDmInviteRequest();
      final parsed = CreateGroupDmInviteRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('CreateGuildInviteRequest round-trips via maybeFromJson/toJson', () {
      const instance = CreateGuildInviteRequest();
      final parsed = CreateGuildInviteRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateChannelInviteRequest.maybeFromJson(null), isNull);
    });
  });
}
