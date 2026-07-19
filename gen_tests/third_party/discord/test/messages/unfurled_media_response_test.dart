// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UnfurledMediaResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UnfurledMediaResponse(
        id: SnowflakeType('0'),
        url: 'example',
        proxyUrl: 'example',
      );
      final parsed = UnfurledMediaResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UnfurledMediaResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UnfurledMediaResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
