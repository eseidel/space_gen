// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Key', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Key(
        key: 'example',
        id: 0,
        url: 'example',
        title: 'example',
        createdAt: DateTime.utc(2024),
        verified: false,
        readOnly: false,
      );
      final parsed = Key.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Key.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Key.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
