// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('BulkDeleteMessagesRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = BulkDeleteMessagesRequest(
        messages: <SnowflakeType>[SnowflakeType('0')],
      );
      final parsed = BulkDeleteMessagesRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BulkDeleteMessagesRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BulkDeleteMessagesRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
