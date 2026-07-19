// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateStageInstanceRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CreateStageInstanceRequest(
        topic: 'example',
        channelId: SnowflakeType('0'),
      );
      final parsed = CreateStageInstanceRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateStageInstanceRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateStageInstanceRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
