// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('FileComponentResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = FileComponentResponse(
        id: 0,
        file: UnfurledMediaResponse(
          id: SnowflakeType('0'),
          url: 'example',
          proxyUrl: 'example',
        ),
        name: 'example',
        size: 0,
        spoiler: false,
      );
      final parsed = FileComponentResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FileComponentResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => FileComponentResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
