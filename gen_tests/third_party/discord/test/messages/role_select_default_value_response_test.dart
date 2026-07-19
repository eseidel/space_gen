// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RoleSelectDefaultValueResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RoleSelectDefaultValueResponse(id: SnowflakeType('0'));
      final parsed = RoleSelectDefaultValueResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RoleSelectDefaultValueResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RoleSelectDefaultValueResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
