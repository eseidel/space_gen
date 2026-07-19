// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('NewMemberActionResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = NewMemberActionResponse(
        channelId: SnowflakeType('0'),
        actionType: NewMemberActionType.view,
        title: 'example',
        description: 'example',
      );
      final parsed = NewMemberActionResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(NewMemberActionResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => NewMemberActionResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
