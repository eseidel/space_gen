// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateLobbyRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CreateLobbyRequest();
      final parsed = CreateLobbyRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateLobbyRequest.maybeFromJson(null), isNull);
    });
  });
}
