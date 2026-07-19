// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetStatus200ResponseServerResets', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetStatus200ResponseServerResets(
        next: 'example',
        frequency: 'example',
      );
      final parsed = GetStatus200ResponseServerResets.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetStatus200ResponseServerResets.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            GetStatus200ResponseServerResets.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
