// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('BulkLobbyMemberRequestFlagsOneOf1', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = BulkLobbyMemberRequestFlagsOneOf1(1);
      final parsed = BulkLobbyMemberRequestFlagsOneOf1.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BulkLobbyMemberRequestFlagsOneOf1.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BulkLobbyMemberRequestFlagsOneOf1.maybeFromJson(-1),
        throwsFormatException,
      );
    });
  });
}
