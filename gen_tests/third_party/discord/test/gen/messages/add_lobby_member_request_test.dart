// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AddLobbyMemberRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AddLobbyMemberRequest();
      final parsed = AddLobbyMemberRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AddLobbyMemberRequest.maybeFromJson(null), isNull);
    });
  });
}
