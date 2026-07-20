// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('EditLobbyRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = EditLobbyRequest();
      final parsed = EditLobbyRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EditLobbyRequest.maybeFromJson(null), isNull);
    });
  });
}
