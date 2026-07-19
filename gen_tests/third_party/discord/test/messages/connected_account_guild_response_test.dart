// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ConnectedAccountGuildResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ConnectedAccountGuildResponse(
        id: SnowflakeType('0'),
        name: 'example',
        icon: 'example',
      );
      final parsed = ConnectedAccountGuildResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ConnectedAccountGuildResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ConnectedAccountGuildResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
