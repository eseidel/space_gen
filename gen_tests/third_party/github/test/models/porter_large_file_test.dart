// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PorterLargeFile', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PorterLargeFile(
        refName: 'example',
        path: 'example',
        oid: 'example',
        size: 0,
      );
      final parsed = PorterLargeFile.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PorterLargeFile.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PorterLargeFile.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
