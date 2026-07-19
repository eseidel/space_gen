// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildRoleTagsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GuildRoleTagsResponse();
      final parsed = GuildRoleTagsResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildRoleTagsResponse.maybeFromJson(null), isNull);
    });
  });
}
